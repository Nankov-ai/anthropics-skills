---
name: skill-evaluator
description: >
  Evaluate whether an Agent Skill is production-ready using the 4-condition eval coverage
  framework (trigger, execution, regression, token budget). Use when the user wants to
  test a skill, audit a SKILL.md, check if a skill is ready to ship, review trigger accuracy,
  or run Evaluation-Driven Development (EDD) on a new skill.
  Do NOT use for creating skills from scratch — use skill-creator for that.
---

# Skill Evaluator

Evaluates Agent Skills for production readiness using the framework from the Agent Skills
whitepaper (Google/Anthropic, May 2026). A skill without passing all four conditions is a
hope, not a capability.

## When to use
- User wants to know if a skill is ready to ship
- User wants to audit a SKILL.md for quality issues
- User wants to write eval cases before drafting a skill (EDD workflow)
- User suspects a skill is mis-triggering or producing bad output

## When NOT to use
- Creating a new skill from scratch (use `skill-creator`)
- Improving skill content unrelated to evaluation

## The 4 Failure Modes (evaluate all 4)

| Mode | Symptom | Where it surfaces |
|---|---|---|
| **Trigger Failure** | Wrong skill fires, or correct one doesn't | Routing logs |
| **Execution Failure** | Triggers correctly, produces wrong output | Output quality |
| **Token Budget Failure** | Skill body too large, degrades co-loaded turns | Under realistic load (5–15 skills active) |
| **Regression** | New skill breaks previously working routing | Full library exercised together |

> A skill body exceeding 5,000 tokens may work in isolation but will cause context rot
> when co-loaded. Always evaluate under realistic co-load conditions.

## Eval Coverage Checklist (all 4 must pass)

- [ ] **Trigger** — 3+ positive AND 3+ negative test cases. Target: 90% trigger accuracy
- [ ] **Execution** — Correct outputs across a representative range of inputs (20+ cases for draft tier)
- [ ] **Regression** — Adding this skill causes zero drops in existing library suite
- [ ] **Token Budget** — Co-loaded with 5–15 active skills, does not degrade unrelated turns

Failure on any single condition holds the skill at draft tier, regardless of happy-path performance.

## Workflow: Evaluating an Existing Skill

1. **Read** the SKILL.md — check description quality (see references/description-checklist.md)
2. **Write trigger tests** — 3 prompts that SHOULD fire, 3 that should NOT
3. **Run each test** — observe whether the skill actually triggered
4. **Write execution tests** — representative inputs with expected tool calls and output format
5. **Check token budget** — count SKILL.md body tokens; flag if > 5,000
6. **Check regression** — run existing library eval suite with new skill added
7. **Report** — use the output format below

## Workflow: Evaluation-Driven Development (EDD — for new skills)

Write eval cases BEFORE drafting the SKILL.md body. Forces a clear spec upfront.

For each eval case, define:
```json
{
  "case_id": "descriptive_id_001",
  "input": "the user message that should trigger this skill",
  "expected_skill": "skill-name",
  "expected_tool_calls": [
    {"tool": "tool_name", "args": {"param": "value"}}
  ],
  "expected_output_format": "what the response should look like",
  "rubric": ["criterion 1", "criterion 2", "criterion 3"]
}
```

Write 3 such cases (2 positive, 1 negative) before writing the body. This surfaces
description ambiguities before they compound.

## Description Quality Check (the routing algorithm)

A good description must pass 4 checks:
1. **Testable specificity** — Can you write 3 positive and 3 negative triggers from it?
2. **Clarity** — No overlap with adjacent skills on ambiguous queries
3. **Execution fidelity** — Describes actual behavior, not aspirational behavior
4. **Rephrasing stability** — Routes consistently regardless of phrasing

Format: `[What it does]. Use when [trigger 1], [trigger 2], [trigger 3]. Do NOT use for [anti-trigger].`

## Skill Smells (flag these)

- Description starts with "a helpful skill for..." → rewrite with trigger + input + output
- Body over 5,000 tokens → split or move detail to `references/`
- No resources referenced → might just belong in the system prompt
- Two teams could plausibly own it → not yet decomposed
- You can't write 3 test cases → description too vague or skill does too many things
- Contains "ALWAYS" or "NEVER" in caps → explain the rationale instead

## Output Format

Report findings using this structure:

```
## Skill Eval Report: <skill-name>

### Description Quality
[PASS/FAIL] — reason

### Trigger Tests
Positive:
- "[prompt]" → [triggered / did not trigger]
Negative:
- "[prompt]" → [stayed quiet / wrongly triggered]
Trigger accuracy: X/6 (target: 90%)

### Execution Tests
- Case 1: [PASS/FAIL] — reason
- Case 2: [PASS/FAIL] — reason

### Token Budget
Body size: ~X tokens [OK / WARNING: exceeds 5,000]

### Regression
[Not tested / PASS / FAIL — reason]

### Verdict
[ ] Ready to ship (all 4 passed)
[ ] Draft tier — blocked on: [list failing conditions]

### Recommended fixes
1. ...
```

## Skill Tiers and Required Eval Depth

| Tier | Minimum eval required |
|---|---|
| Read-Only | LLM-as-Judge eval + 90% trigger accuracy |
| Draft-Only | Golden dataset 20+ cases + human approval |
| Action-Allowed | Full adversarial red-teaming + pass^k (multiple runs) + no rollback events |

For LLM-as-Judge: always swap positions of reference and actual outputs to eliminate
ordering bias. Calibrate against human ratings until 90% agreement.

See `references/failure-modes.md` for detailed failure mode examples.
See `references/description-checklist.md` for description quality rubric.
