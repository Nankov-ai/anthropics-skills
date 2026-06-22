---
name: verify
description: >
  Verify that a code change actually does what it's supposed to by running the app and observing behavior. Use when asked to verify a fix works, test a change manually, or validate before pushing.
---

# Verify

## Overview
Verify a code change works by running the app and observing real behavior.

## When to trigger
- 'verify this works', 'confirm the fix', 'test this change'
- Before marking a task done when behavior can be observed
- Validating local changes before pushing

## Workflow
1. Identify what behavior to verify
2. Run the app or relevant test
3. Exercise the specific changed path
4. Observe and report actual output
5. Flag any unexpected behavior

## Rules
- Never claim 'it works' without actually running it
- Report exact output/errors — don't paraphrase
- Check edge cases, not just the happy path
- If UI: take a screenshot or describe what was seen
