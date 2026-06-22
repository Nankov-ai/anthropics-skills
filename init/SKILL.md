---
name: init
description: >
  Initialize a new CLAUDE.md file with codebase documentation.
---

# Init (CLAUDE.md)

## Overview
Creates a CLAUDE.md file that documents the codebase for Claude.

## When to trigger
- User asks to initialize Claude for a project
- No CLAUDE.md exists and user wants one created
- /init command

## CLAUDE.md structure
`markdown
# Project Name

## Overview
What this project does and why.

## Architecture
Key directories and their purpose.

## Commands
Build, test, lint, run commands.

## Conventions
Code style, naming, patterns to follow.

## Key files
Most important files and what they do.
`

## Rules
- Be factual — only document what actually exists
- Keep commands copy-pasteable
- Update when the user changes architecture or conventions
