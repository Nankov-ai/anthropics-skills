---
name: loop
description: >
  Run a prompt or slash command on a recurring interval (e.g. /loop 5m /foo). Omit the interval to let the model self-pace. Use for recurring tasks, polling, or running something repeatedly.
---

# Loop

## Overview
Runs a prompt or slash command repeatedly on a timer.

## Usage
`
/loop [interval] [prompt or /command]
/loop 5m /code-review
/loop check if the build is passing
`

## Interval formats
- 30s — 30 seconds
- 5m — 5 minutes
- 1h — 1 hour
- (omit) — model self-paces using ScheduleWakeup

## When to use
- Polling CI/CD status
- Periodic health checks
- Repeating a review or audit task

## When NOT to use
- One-off tasks (use /run or direct commands instead)
