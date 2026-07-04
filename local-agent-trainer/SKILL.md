---
name: local-agent-trainer
description: Interactive skill for collaboratively designing, training, and iterating on a local Ollama agent. Use when the user wants to build, refine, or test a custom Ollama model. Triggers on phrases like "treinar agente", "criar modelo ollama", "agent training", "modelfile", "build support bot", "treinar bot local".
---

# Local Agent Trainer — Ollama

This skill guides a hands-on, iterative session where Claude and the user build a custom Ollama agent together. By the end, the user has a working **Modelfile** they can deploy locally with two commands:

```bash
ollama create my-agent -f Modelfile
ollama run my-agent
```

---

## What is a Modelfile?

An Ollama Modelfile is like a recipe for a custom model. It contains:

| Directive     | Purpose                                              |
|---------------|------------------------------------------------------|
| `FROM`        | Base model to build on (e.g. `llama3.2`, `mistral`) |
| `SYSTEM`      | The agent's persona, rules, and tone                 |
| `PARAMETER`   | Behavior tuning (temperature, context window, etc.)  |
| `MESSAGE`     | Few-shot examples that shape how the agent responds  |

The `SYSTEM` + `MESSAGE` pair is where most of the "training" happens for a local agent — there is no gradient descent, just prompt engineering and curated examples. This is powerful enough for most support/assistant use cases.

---

## Workflow Overview

```
Phase 1 → Define purpose & persona
Phase 2 → Write the SYSTEM prompt
Phase 3 → Collect example conversations (MESSAGE pairs)
Phase 4 → Export Modelfile & run locally
Phase 5 → Evaluate, gather feedback, iterate
```

Repeat Phase 3→5 as many times as needed.

---

## Phase 1 — Define Purpose & Persona

Ask the user these questions (one at a time, conversationally):

1. **What does this agent do?** (e.g. "customer support for a SaaS app", "IT helpdesk for a school")
2. **Who are the users?** (tone: formal vs casual, technical vs non-technical)
3. **What should the agent NEVER do?** (scope limits, escalation rules, topics to avoid)
4. **Does the agent have a name or brand?** (e.g. "Sofia da Acme", "HelpBot")
5. **What base model is available?** (ask `ollama list` — suggest `llama3.2` or `mistral` if unsure)

Record answers — they feed directly into the SYSTEM prompt in Phase 2.

---

## Phase 2 — Write the SYSTEM Prompt

Draft a SYSTEM prompt based on Phase 1 answers. Structure it as:

```
You are [NAME], a [ROLE] for [COMPANY/CONTEXT].

Your job is to [PRIMARY PURPOSE].

Tone: [TONE DESCRIPTION]

Rules:
- [RULE 1]
- [RULE 2]
- If you don't know the answer, say so and suggest [ESCALATION PATH].

Never:
- [HARD LIMIT 1]
- [HARD LIMIT 2]
```

Show the draft to the user and refine together before moving on. A good SYSTEM prompt is the single highest-leverage part of the agent.

---

## Phase 3 — Collect Example Conversations

Examples (MESSAGE pairs) teach the agent *how* to respond, not just *what* to say. They show tone, format, and handling of edge cases.

### How to collect examples

Say to the user:
> "Vamos adicionar exemplos. Pensa nas perguntas mais comuns que o agente vai receber. Diz-me uma pergunta típica e como o agente deveria responder — eu formato o par."

For each example, produce a MESSAGE block:

```
MESSAGE user "{{ user question }}"
MESSAGE assistant "{{ ideal response }}"
```

### Minimum viable set

Aim for **5–10 examples** covering:
- A routine question with a clear answer
- A question where the agent doesn't know and must escalate
- A rude or out-of-scope question (graceful refusal)
- A multi-step question (shows structured responses)
- An edge case specific to the domain

### Tips

- Examples should match the tone defined in SYSTEM.
- Keep responses realistic — don't make the agent sound superhuman.
- If the user isn't sure, roleplay: ask them to pretend to be a customer and ask questions naturally. Record their reactions.

---

## Phase 4 — Export Modelfile & Run Locally

Assemble the full Modelfile and show it to the user:

```
FROM {{ base_model }}

SYSTEM """
{{ system_prompt }}
"""

PARAMETER temperature {{ temperature }}
PARAMETER num_ctx {{ context_window }}

{{ MESSAGE pairs }}
```

### Recommended default parameters

| Parameter     | Default | Notes                                          |
|---------------|---------|------------------------------------------------|
| `temperature` | `0.4`   | Lower = more consistent, less creative         |
| `num_ctx`     | `4096`  | Context window; increase for long conversations|

### Commands to run

```bash
# Save the Modelfile to disk
# (Claude will write it to the working directory as "Modelfile")

# Create the custom model
ollama create my-support-agent -f Modelfile

# Run it interactively
ollama run my-support-agent
```

Tell the user: "Testa o agente com 3–5 perguntas reais. Anota onde a resposta ficou boa e onde ficou estranha."

---

## Phase 5 — Evaluate & Iterate

After the user tests the agent, run a structured debrief:

### Evaluation questions

Ask the user to rate each test interaction:

| Critério               | 1–5 | Notas |
|------------------------|-----|-------|
| Resposta correta?      |     |       |
| Tom adequado?          |     |       |
| Comprimento certo?     |     |       |
| Seguiu as regras?      |     |       |

### Common problems & fixes

| Symptom                              | Fix                                                                 |
|--------------------------------------|---------------------------------------------------------------------|
| Respostas demasiado longas           | Add to SYSTEM: "Keep responses under 3 sentences unless asked."    |
| Tom errado (demasiado formal/casual) | Rewrite SYSTEM tone section; add a MESSAGE example with right tone |
| Inventa factos                       | Add to SYSTEM: "Only answer what you know. Never guess."           |
| Ignora regras de escalamento         | Add a specific MESSAGE example showing correct escalation          |
| Responde a perguntas fora do âmbito  | Add a MESSAGE example of graceful refusal                          |

### Iteration loop

After each fix:
1. Update the Modelfile (SYSTEM or MESSAGE)
2. Re-create the model: `ollama create my-support-agent -f Modelfile`
3. Re-test the specific failing case
4. Re-evaluate

Typical good agent: 2–4 iteration cycles.

---

## Checkpoints

Use these to know when to move to the next phase:

- **Phase 1 → 2**: All 5 persona questions answered
- **Phase 2 → 3**: SYSTEM prompt approved by user
- **Phase 3 → 4**: At least 5 examples collected, covering the minimum viable set
- **Phase 4 → 5**: User has tested the agent at least 3 times
- **Done**: User scores all criteria ≥ 4/5 on a representative test set

---

## Session State (maintain in conversation)

Track these across the session:

```
base_model: 
agent_name: 
system_prompt: (draft → approved)
parameters: {temperature: , num_ctx: }
examples: [] (list of {user, assistant} pairs)
iteration: 1
```

Update as the session progresses. When the user resumes a session, ask them to paste the last Modelfile to restore state.

---

## Quick Reference: Modelfile Template

```
FROM llama3.2

SYSTEM """
[SYSTEM PROMPT HERE]
"""

PARAMETER temperature 0.4
PARAMETER num_ctx 4096

MESSAGE user "[example question 1]"
MESSAGE assistant "[example response 1]"

MESSAGE user "[example question 2]"
MESSAGE assistant "[example response 2]"
```
