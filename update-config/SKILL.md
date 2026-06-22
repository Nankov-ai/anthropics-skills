---
name: update-config
description: >
  Configure the Claude Code harness via settings.json. Use for automated behaviors (hooks), permissions, env vars, or any changes to settings.json/settings.local.json.
---

# Update Config

## Overview
Configure Claude Code via .claude/settings.json or ~/.claude/settings.json.

## When to trigger
- Automated behaviors: 'from now on when X', 'each time X', 'before/after X'
- Permissions: 'allow X', 'add permission for Y'
- Env vars: 'set X=Y'
- Hook troubleshooting

## Settings structure
`json
{
  "permissions": {
    "allow": ["Bash(npm:*)", "Bash(git log:*)"],
    "deny": []
  },
  "env": {
    "MY_VAR": "value"
  },
  "hooks": {
    "PostToolUse": [{ "matcher": "Bash", "hooks": [{"type": "command", "command": "echo done"}] }]
  }
}
`

## Scope
- Project: .claude/settings.json — affects this project only
- Global: ~/.claude/settings.json — affects all projects

## Note
For simple settings (theme, model), suggest /config command instead.
