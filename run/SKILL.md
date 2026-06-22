---
name: run
description: >
  Launch and drive this project's app to see a change working. Use when asked to run, start, or screenshot the app, or confirm a change works in the real app.
---

# Run

## Overview
Launches the project's app and verifies changes work in the real environment.

## When to trigger
- 'run the app', 'start the server', 'show me it working'
- Confirming a change works before reporting done

## Workflow
1. Check for project-specific launch skill first
2. Detect project type (web server, CLI, Electron, etc.)
3. Run the appropriate start command
4. Observe output / take screenshot if UI
5. Report what was observed

## Common start commands
| Type | Command |
|---|---|
| Node/npm | 
pm run dev / 
pm start |
| Python | python main.py / uvicorn app:app |
| Go | go run . |
| Docker | docker compose up |

## Rules
- Don't claim success without actually observing the running app
- Report errors verbatim if the app fails to start
