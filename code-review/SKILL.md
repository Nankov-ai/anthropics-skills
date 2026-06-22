---
name: code-review
description: >
  Review the current diff for correctness bugs and reuse/simplification/efficiency cleanups. Effort levels: low/medium (fewer findings), high/max (broader), ultra (deep multi-agent cloud review). Pass --comment to post as inline PR comments, --fix to apply findings.
---

# Code Review

## Overview
Reviews git diffs for bugs, inefficiencies, and simplification opportunities.

## Usage
`
/code-review [low|medium|high|max|ultra] [--comment] [--fix]
`

## Effort levels
| Level | Behaviour |
|---|---|
| low/medium | Fewer, high-confidence findings only |
| high/max | Broader coverage, may include uncertain findings |
| ultra | Deep multi-agent cloud review |

## Flags
- --comment: post findings as inline PR comments
- --fix: apply findings to working tree after review

## Focus areas
1. Correctness bugs (logic errors, off-by-one, null deref)
2. Security issues (injection, auth bypass, data exposure)
3. Simplification / reuse opportunities
4. Performance / efficiency
