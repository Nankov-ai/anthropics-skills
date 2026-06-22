# Failure Mode Reference

Source: Agent Skills whitepaper, Google/Anthropic, May 2026 (Section 4)

## Trigger Failure

The wrong skill fires, or the correct one fails to fire.

**Real data**: Vercel production analysis found a 56% non-invocation rate for skills
expected to activate consistently. A skill stripped of its instructions scored 58%, while
the agent without the skill scored 63% — a 5-point deficit showing a poorly-designed
skill actively subtracts capability.

**Causes**:
- Description too vague or uses internal jargon
- Description overlaps with adjacent skills on ambiguous queries
- Missing negative trigger clause ("Do NOT use for...")
- Trigger keywords buried instead of front-loaded

**Fix**: Rewrite description. Front-load keywords. Add explicit when-not-to-use clause.
Test with 3 positive + 3 negative prompts.

---

## Execution Failure

Skill triggers correctly but produces incorrect output or errant tool calls.

**Key insight (Latitude, March 2026)**: Final-output-only scoring passes 20–40% more
cases than trajectory-aware scoring. The gap represents cases where the agent reached
the correct answer via an incorrect sequence of tool calls. This is acceptable in
read-only scenarios but critical in action-allowed skills where wrong tool trajectories
cause irreversible side effects.

**Trajectory scoring modes (Google ADK)**:
- `EXACT` — exact tool order required (use for action-allowed)
- `IN_ORDER` — ordered subset (use for action-allowed)
- `ANY_ORDER` — unordered subset (acceptable for read-only)

**Fix**: Test tool trajectory separately from final output. Use EDD (define expected
tool calls before writing the skill body).

---

## Token Budget Failure

Skill body too large; crowds context window and degrades performance on unrelated turns.

**Real data**:
- MCPVerse: 18.2% accuracy drop in Claude Sonnet due to tool proliferation and context
  attention competition
- Chroma Research (2025): All frontier models degrade as input grows, even when task
  difficulty is held constant
- "Lost in the Middle" (Liu et al., TACL 2024): Performance degrades for information
  in the middle of context; U-curve holds even for models trained on long contexts

**Rule**: A skill body exceeding 5,000 tokens may pass in isolation but will cause context
rot when co-loaded with 5–15 other skills (active context ~50K+).

**Fix**: Move detail to `references/`. Split large skills. Keep body under 5,000 tokens.
Test co-loaded, not in isolation.

---

## Regression

A newly added skill overlaps with an existing one, breaking previously working routing.

**Causes**:
- New skill description overlaps with existing skills on ambiguous queries
- Shared trigger keywords without differentiation

**Fix**: Run full library eval suite whenever a new skill is added. Check for description
overlap with related skills before shipping.

---

## Production Degradation Factors

When calibrating eval thresholds, account for:

1. **Production Degradation**: ReliabilityBench shows production performance typically
   drops 20–30% compared to offline benchmark pass@1 numbers.

2. **Simulation Bias**: Simulation-based evaluations can be optimistically biased by up
   to 9% ("Lost in Simulation" finding).

3. **pass^k vs pass^1**: GPT-4o scored 61% on pass^1 but dropped below 25% on pass^8
   (tau-bench, Yao et al. 2024). Single-run success is a poor predictor of reliability.
   Action-allowed skills require sustained pass^k across multiple runs.
