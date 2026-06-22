---
name: faturix
description: >
  Specialist skill for the Nodeflow Faturix agent - Ollama (mistral:7b) + Streamlit pipeline
  for structured extraction of financial documents (invoices, credit notes, purchase orders).
  Trigger when: Faturix project, Modelfile training, _sanitize_result() fixes, Streamlit debug,
  invoice extraction, Ollama agent training, PDF financial document parsing, nodeflow-faturix model.
---

# Nodeflow Faturix - Development Skill

**Project location:** C:/projetos/Agente/
**Current state:** always read C:/projetos/Agente/CLAUDE.md first.

## Architecture

PDF/Image -> Pre-processing (pdfplumber/Tesseract/OpenCV/QR Code AT) -> Ollama nodeflow-faturix (mistral:7b) -> _sanitize_result() -> JSON -> Streamlit UI

Key files:
- app.py - full pipeline + Streamlit UI
- Modelfile - system prompt + MESSAGE training pairs (29 examples)
- CLAUDE.md - project state, fixes, known limitations

## Diagnostic Workflow

### Step 0 - Check _sanitize_result receives a dict
Most common silent failure: model emits text before/after JSON, json.loads fails, _sanitize_result receives str and exits. Signal: multiple fixes fail simultaneously.
Fix 9 (applied): _ollama_request extracts {...} block with stripped.find('{') before json.loads.

### Step 1 - Test regex in isolation

### Step 2 - Fix vs training example
| Field always wrong for format | Fix in _sanitize_result |
| Field correct sometimes | Training example in Modelfile |
| Model invents values | Rule in SYSTEM prompt |

## Useful Commands

bash
python -m streamlit run C:\\projetos\\Agente\\app.py
ollama create nodeflow-faturix -f C:/projetos/Agente/Modelfile

## Architecture Decisions
- mistral:7b over llama3.1:8b (better JSON) and gemma4 (hallucinated values)
- pdfplumber first, Tesseract fallback (score < 0.75)
- QR Code AT takes precedence over extracted text
- No arithmetic - all values extracted from document
- _sanitize_result instead of retraining - faster, deterministic, auditable
