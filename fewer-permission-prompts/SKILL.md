---
name: fewer-permission-prompts
description: >
  Scan transcripts for common read-only Bash and MCP tool calls, then add a prioritized allowlist to project .claude/settings.json to reduce permission prompts.
---

# Fewer Permission Prompts

## Overview
Reduces permission prompts by adding safe commands to the allowlist in .claude/settings.json.

## When to trigger
- User is annoyed by repeated permission prompts
- User asks to 'allow X' or 'stop asking permission for Y'

## Workflow
1. Read .claude/settings.json (or create if missing)
2. Scan recent transcript for repeated tool calls
3. Add safe, read-only commands to llowedTools or permissions.allow
4. Write updated settings

## Safety rules
- Only allowlist read-only and non-destructive commands
- Never allowlist m, git push --force, or destructive ops
- Prefer project settings over global settings for project-specific tools
