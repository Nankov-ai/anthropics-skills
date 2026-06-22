---
name: skill-creator
description: >
  Create new skills, modify and improve existing skills, measure skill performance, run evals, benchmark with variance analysis, and optimize skill descriptions for better triggering accuracy.
---

# Skill Creator

## Overview
Create, improve, evaluate, and optimize Claude Code skills.

## When to trigger
- User wants to create a skill from scratch
- Edit or optimize an existing skill
- Run evals to test a skill
- Benchmark skill performance

## Skill structure
`
skills/<name>/
  SKILL.md          # Frontmatter + instructions
  references/       # Supporting docs (optional)
`

## SKILL.md frontmatter
`yaml
---
name: skill-name
description: >
  One paragraph. Must answer: when to trigger, what it does.
  This text drives auto-triggering — be specific and keyword-rich.
---
`

## Workflow for new skills
1. Define purpose and trigger conditions
2. Write SKILL.md with clear workflow
3. Test with representative prompts
4. Measure trigger accuracy
5. Iterate on description if triggering misses

## Eval approach
- 10+ test prompts (5 should trigger, 5 should not)
- Measure precision and recall
- Report variance across runs
