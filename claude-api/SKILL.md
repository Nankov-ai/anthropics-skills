---
name: claude-api
description: >
  Build, debug, and optimize Claude API / Anthropic SDK apps. Includes prompt caching, tool use, thinking, batch, files, citations, memory. Handles model version migrations.
---

# Claude API

## Overview
Build, debug, and optimize apps using the Claude API (Anthropic SDK).

## Always include
- Prompt caching (cache_control: {type: 'ephemeral'}) on large static content
- Correct model IDs: claude-sonnet-4-6, claude-opus-4-8, claude-haiku-4-5-20251001

## Key features
| Feature | Notes |
|---|---|
| Tool use | 	ools array + 	ool_choice |
| Extended thinking | 	hinking: {type: 'enabled', budget_tokens: N} |
| Batch | nthropic.beta.messages.batches |
| Files API | Upload once, reference by file_id |
| Citations | citations: {enabled: true} |

## Model migration
- 4.5 → 4.6: drop-in replacement for Sonnet/Haiku
- Retired models: check docs for current replacements

## Trigger
Code imports nthropic or @anthropic-ai/sdk.
