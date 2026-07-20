# Prompt Frameworks — quick reference

Catalog of named prompt structures, grouped by what they optimize for. Use this to
pick the right skeleton before drafting, or to identify which framework an existing
prompt is already using (or missing) during an audit.

## Basic (short tasks, single-shot)

| Framework | Components | Best for |
|---|---|---|
| **TAG** | Task, Action, Goal | Very short, single-purpose prompts |
| **RTF** | Role, Task, Format | Simple, clean single-turn requests where output shape matters |

## Context-heavy (nuanced tone/audience)

| Framework | Components | Best for |
|---|---|---|
| **CO-STAR** | Context, Objective, Style, Tone, Audience, Response | Content/copywriting where voice and audience must be precise |
| **SPAR** | Situation, Problem, Action, Result | Case-study / consulting-style narrative asks |

## Persona-heavy (role drives everything)

| Framework | Components | Best for |
|---|---|---|
| **CREATE** | Character, Request, Examples, Adjustments, Type of output, Extras | Rich persona + style calibration (copywriting, branded voice) |
| **RACE** | Role, Action, Context, Expectation | Role-driven tasks with a clear expected outcome |
| **PACEF** | Persona, Ação, Contexto, Estilo, Foco | Marketing/sales prompts needing persona + tight focus |

## Process-driven (multi-step execution)

| Framework | Components | Best for |
|---|---|---|
| **RISE** | Role, Input, Steps, Execution | Tasks that need an explicit procedure |
| **RISEN** | Role, Instructions, Steps, End goal, Narrowing | Same as RISE + explicit scope constraints |
| **PASECT** | Persona, Action, Steps, Examples, Context, Template | The most complete general-purpose skeleton — good default for complex briefs |

## Choosing a framework

- Single clear deliverable, no persona needed → **RTF** or **TAG**
- Tone/audience is the hard part → **CO-STAR**
- The "who is speaking" defines the whole output → **CREATE**, **RACE**, or **PACEF**
- The task is a sequence of steps → **RISE** / **RISEN**
- Complex brief, unsure which to pick → **PASECT** (superset of the others)

Frameworks are skeletons, not straitjackets — this skill's own Core Structure
(Role → Mission → Context → Behavior Rules → Output Format → Constraints) already
covers what most of these frameworks ask for. Reach for a named framework mainly
when the user recognizes it by name, or when a specific framework's emphasis
(e.g., CO-STAR's tone/audience split) genuinely fits the brief better.

## Source

Extracted from `Engenharia-de-Prompts-Book.pdf` (user's personal training library,
`G:\O meu disco\Formação\Prompts\`), Jul 2026.
