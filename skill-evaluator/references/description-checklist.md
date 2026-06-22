# Description Quality Checklist

The description field is the routing algorithm. The model sees ONLY the description
to decide whether to load the skill. Spend more time here than anywhere else.

## Format Template

```
[Verb-led sentence stating what it does.] Use when the user [trigger phrase 1],
[trigger phrase 2], or [trigger phrase 3].
Do NOT use for [anti-trigger 1] or [anti-trigger 2].
```

## Length
- API: ≤ 200 characters
- YAML frontmatter: ≤ 1,024 characters
- Most authors aim for ~50 words

## The 4 Checks for 90% Trigger Accuracy

| Check | Question | Fix if failing |
|---|---|---|
| Testable specificity | Can I write 3 positive + 3 negative triggers? | Narrow scope or split into two skills |
| Clarity | Does it overlap with adjacent skills on ambiguous queries? | Add distinguishing keywords or explicit exclusions |
| Execution fidelity | Does it describe actual behavior, not aspirational? | Remove "helps with", "can assist", etc. |
| Rephrasing stability | Does it route consistently across phrasings? | Add synonym keywords |

## Dos

- Front-load trigger keywords ("Generate...", "Create...", "Evaluate...")
- State what it does AND when to use it AND when NOT to use it
- Be pushy when the model under-triggers ("ALWAYS use this skill when...")
- Use specific verbs: generate, evaluate, extract, convert, draft, summarize

## Don'ts

- "a helpful skill for..." → rewrite
- "helps with documents" → too vague
- Starting with "This skill..." → start with the verb
- Omitting the when-not-to-use clause → causes over-triggering
- Internal jargon outsiders won't recognize

## Red Flags in the Description

- Uses "and" between unrelated capabilities → split the skill
- No trigger phrases, just a general description → add concrete scenarios
- Exact same trigger keywords as another skill → differentiate or merge

## Testing the Description

Write these 6 test prompts before shipping:

**Should trigger (3 positive):**
1. The most obvious phrasing
2. A paraphrase using different words
3. An implicit request where the skill is needed but not named

**Should NOT trigger (3 negative):**
1. A related but out-of-scope request
2. A request for an adjacent skill
3. A completely unrelated request

If any of the 3 positive don't trigger, the description needs more keywords.
If any of the 3 negative wrongly trigger, the description needs a clearer exclusion clause.
