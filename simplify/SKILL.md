---
name: simplify
description: >
  Review changed code for reuse, simplification, efficiency, and altitude cleanups, then apply the fixes. Quality only — does not hunt for bugs.
---

# Simplify

## Overview
Simplify and clean up code — reduce duplication, improve readability, increase efficiency.

## When to trigger
- /simplify command
- User asks to clean up, simplify, or refactor code

## Focus areas (quality only, not bugs)
1. **Duplication** — extract repeated logic
2. **Complexity** — reduce nesting, shorten functions
3. **Naming** — rename unclear identifiers
4. **Dead code** — remove unused variables/functions
5. **Efficiency** — obvious algorithmic improvements

## Rules
- Do NOT change behavior — only restructure
- Do NOT add features or error handling that wasn't there
- Apply fixes directly to the working tree
- Report what was changed and why

## Anti-patterns to eliminate
- Functions > 40 lines doing multiple things
- Nested ternaries / callback hell
- Magic numbers without named constants
- Comments explaining WHAT instead of WHY
