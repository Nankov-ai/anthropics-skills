---
name: keybindings-help
description: >
  Customize keyboard shortcuts, rebind keys, add chord bindings, or modify ~/.claude/keybindings.json.
---

# Keybindings Help

## Overview
Configure custom keyboard shortcuts in ~/.claude/keybindings.json.

## When to trigger
- User wants to rebind a key, add a chord shortcut, or change the submit key
- Any modification to keybindings.json

## keybindings.json structure
`json
[
  {
    "key": "ctrl+shift+r",
    "command": "/review",
    "description": "Run code review"
  }
]
`

## Common requests
| Request | Action |
|---|---|
| Change submit key | Modify enter/ctrl+enter binding |
| Add chord | Create two-key sequence binding |
| Rebind slash command | Map key to /skill-name |

## File location
~/.claude/keybindings.json (global) or .claude/keybindings.json (project)
