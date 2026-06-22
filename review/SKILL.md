---
name: review
description: >
  General code and content review. Use when the user wants feedback on code, writing, or a document.
---

# Review

## Overview
General-purpose review for code, writing, or documents.

## When to trigger
- User asks for feedback, a review, or 'what do you think of this'
- Reviewing PRs, documents, specs, or designs

## Review dimensions
1. **Correctness** — does it do what it's supposed to?
2. **Clarity** — is it easy to understand?
3. **Completeness** — is anything missing?
4. **Consistency** — does it match conventions/style?
5. **Risk** — anything that could go wrong?

## Output format
- Lead with the most important finding
- Group by severity (critical → major → minor → nit)
- Always include at least one positive observation

## Notes
For code specifically, prefer /code-review for diff-based review.
