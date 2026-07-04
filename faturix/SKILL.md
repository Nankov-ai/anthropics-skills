---
name: faturix
description: >
  Specialist skill for developing and maintaining the Nodeflow Faturix agent —
  a local Ollama (mistral:7b) + Streamlit pipeline for structured extraction of
  financial documents (invoices, credit notes, purchase orders).
  Use this skill whenever working on the Faturix project: adding training
  examples to the Modelfile, diagnosing wrong field extractions, writing
  deterministic post-processing fixes in _sanitize_result(), debugging the
  Streamlit app, or discussing the extraction pipeline architecture.
  Also trigger when the user mentions invoice extraction, Ollama agent training,
  PDF financial document parsing, or the nodeflow-faturix model.
---

# Nodeflow Faturix — Development Skill

**Project location:** `C:/projetos/Agente/`
**Current state:** always read `C:/projetos/Agente/CLAUDE.md` first — it contains the up-to-date phase, all applied fixes, and the 29 training examples.

---

## Architecture overview

```
PDF / Image
  → Pre-processing (pdfplumber / Tesseract OCR / OpenCV / QR Code AT)
  → Ollama model: nodeflow-faturix (mistral:7b)   ← few-shot trained
  → _sanitize_result()                             ← deterministic post-fixes
  → JSON output displayed in Streamlit UI
```

Key files:
- `app.py` — full pipeline + Streamlit UI
- `Modelfile` — system prompt + MESSAGE training pairs (currently 29 examples)
- `CLAUDE.md` — project state, all fixes, known limitations, test cases

---

## Diagnostic workflow (when a field is wrong)

### Step 0 — Check if `_sanitize_result` is receiving a dict

This is the most common silent failure. When the model emits text before/after
the JSON (or wraps it in markdown fences), `json.loads` fails and
`_sanitize_result` receives a `str`, exits immediately, and applies no fixes.
The JSON still renders correctly in the UI via `st.code` — making the problem
invisible.

**Signal:** multiple fixes fail simultaneously → suspect this first.

**Fix 9** (already applied): `_ollama_request` extracts the `{...}` block with
`stripped.find("{")` before attempting `json.loads`.

### Step 1 — Test the regex in isolation before anything else

```python
import re
text = "VAT - ESA08829699"
m = re.compile(r'VAT\s*[\s\-:]+\s*([A-Z]{2}[A-Z0-9]{7,12})', re.IGNORECASE).search(text)
print(m.group(1) if m else "NO MATCH")
```

Common silent failures:
- `\b` word boundary doesn't work with Unicode/special chars from pdfplumber
- pdfplumber may extract `.` or `:` as non-ASCII Unicode equivalents
- Fix: use permissive separators (`[\s\-:]+`), avoid `\b` at token ends

### Step 2 — Decide: deterministic fix vs. training example

| Situation | Action |
|---|---|
| Field always wrong for a specific format | Fix in `_sanitize_result` |
| Field correct sometimes, wrong other times | Training example in Modelfile |
| Model invents values | Rule in SYSTEM prompt |
| Ambiguous layout with no text solution | Document as known limitation |

---

## Patterns for `_sanitize_result` fixes

Fixes are **additive and non-destructive** — they only correct `null` fields or
clearly wrong values; they never overwrite values the model extracted correctly.

```python
# Fix 2 — imposto_taxa null when document clearly shows 0% VAT
if result.get("imposto_taxa") is None:
    if result.get("imposto_valor") in (0, 0.0):   # logical inference
        result["imposto_taxa"] = 0
    elif imp_val is None and any(p.search(text) for p in _ZERO_TAX_PATTERNS):
        result["imposto_taxa"] = 0
        result["imposto_valor"] = 0.00

# Fix 7 — NIF without country prefix (Spanish CIF format)
current_nif = re.sub(r'[\s\-.]', '', result.get("fornecedor_nif") or '').upper()
if current_nif and not re.match(r'^[A-Z]{2}[A-Z0-9]', current_nif):
    mv = _VAT_LINE.search(text)   # finds "VAT - ESA08829699"
    if mv:
        result["fornecedor_nif"] = re.sub(r'\s+', '', mv.group(1)).upper()
```

Always define module-level compiled regex constants (`re.compile(...)`) — never
inline regex in `_sanitize_result`.

---

## Adding a training example to the Modelfile

1. Extract the document text from the UI ("Texto extraído do PDF" panel)
2. Identify every wrong field in the model's raw output (before fixes)
3. Build the correct JSON manually
4. Open `C:/projetos/Agente/Modelfile`
5. Append a new MESSAGE pair:
   ```
   {"role": "user", "content": "Analisa este documento:\n\n<text>"}
   {"role": "assistant", "content": "<correct_json>"}
   ```
6. Recreate the agent: `ollama create nodeflow-faturix -f Modelfile`
7. Test with the same document in the app

**Note:** training examples are few-shot, not fine-tuning. The model may still
fail on other documents of the same type. Deterministic fixes are more robust
for recurring patterns.

---

## Established architectural decisions

- **mistral:7b** chosen over llama3.1:8b (better JSON structure) and gemma4:e4b
  (hallucinated values)
- **pdfplumber first, Tesseract fallback** — quality scored by `_text_quality()`
  (score < 0.75 or lines starting with `=` trigger OCR fallback at 400 DPI)
- **QR Code AT takes precedence** over extracted text — provides exact financial
  fields for Portuguese invoices
- **No arithmetic** — all values extracted from document, never calculated
- **`_sanitize_result` instead of retraining** — faster, deterministic, auditable

---

## Useful commands

```bash
# Run the app
python -m streamlit run C:\projetos\Agente\app.py

# Recreate agent after editing Modelfile
ollama create nodeflow-faturix -f C:/projetos/Agente/Modelfile

# Test _sanitize_result in isolation
python -c "
import sys; sys.path.insert(0, 'C:/projetos/Agente')
import app, json
result = {...}   # paste model output here
text = '...'     # paste extracted text here
print(json.dumps(app._sanitize_result(text, result), indent=2, ensure_ascii=False))
"
```
