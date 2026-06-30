---
description: Analyze the current project and activate all relevant skills
argument-hint: [focus area optional]
allowed-tools: Read, Glob, Bash, Write
---

You are starting a project analysis session. Your job is to:
1. Understand what this project is
2. Identify which skills are relevant
3. Explicitly apply each relevant skill's guidance to the project

## Step 1 — Read the project

Read these files if they exist (do not fail if missing):
- CLAUDE.md
- package.json / pyproject.toml / pom.xml / Cargo.toml (whichever exists)
- README.md
- .env.example
- src/ or app/ directory structure (top level only)

Then summarize in 2-3 sentences: what is this project, what stack, what stage.

## Step 2 — Map project to skills

Based on what you found, select ALL relevant skills from this list:

**Always apply:**
- `nando-global` — QA rules P1/P2/P3 (always active)
- `context-engineering` — you are now operating in a project context; apply the 5-layer model

**Apply if project has frontend / UI:**
- `frontend-design` — UI/UX patterns and component structure
- `webapp-testing` — testing strategy for the app

**Apply if project is an AI agent / LLM system:**
- `ai-agent-patterns` — select the right architectural pattern
- `agent-reasoning` — reasoning strategies
- `enterprise-ai-agent-designer` — if it's a business-facing agent

**Apply if project has payments / is a Portuguese product:**
- `pt-checkout-builder` — checkout flows, NIF, IVA, MB Way

**Apply if project has security-sensitive code (auth, APIs, payments):**
- `security-review` — flag any existing vulnerabilities

**Apply if project has no CLAUDE.md yet:**
- `init` — create one before anything else

**Apply if user mentioned a specific focus in $ARGUMENTS:**
- Map the focus to the most relevant skill and apply it first

**Apply for self-improving or automated workflows:**
- `loop-engineering` — if the project involves scheduled or autonomous tasks
- `self-improving-loop` — if the project involves agents that run repeatedly

**Apply if there are compliance requirements (EU, RGPD, AI Act):**
- `aiact` — AI Act classification and compliance

## Step 3 — Report and apply

Output a table:

| Skill | Why relevant | Priority |
|---|---|---|
| nando-global | Always active | P1 |
| ... | ... | ... |

Then, **for each selected skill**, apply its guidance to the current project context.
Do not just list the skills — actually use them. Produce the analysis, recommendations,
or output that each skill would generate for this specific project.

If $ARGUMENTS specifies a focus area (e.g. "security", "payments", "architecture"),
prioritize that skill first and go deeper on it.

## Step 4 — Next steps

End with a short list of 3-5 concrete next actions for this project, derived from
the skills applied.
