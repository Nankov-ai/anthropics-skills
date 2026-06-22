---
name: agent-prompt-builder
description: >
  Use this skill to create, structure, and optimize system prompts for AI agents across
  any platform: Google Gemini Gems, OpenAI Custom GPTs, Claude Projects, Copilot Agents,
  Mistral Le Chat agents, or any LLM-based assistant. Triggers when the user wants to
  build a GPT, create a Gem, write a system prompt, design an AI assistant, create an agent,
  improve, audit, translate, or convert an existing system prompt between platforms.
---

# Agent Prompt Builder

## Platforms Supported
| Platform | Max Prompt | Key Constraints |
|---|---|---|
| OpenAI Custom GPT | ~8000 chars | Instructions field; files/knowledge |
| Google Gemini Gem | ~8000 chars | No tool references |
| Anthropic Claude Project | ~200K tokens | Full markdown |
| Microsoft Copilot | ~4000 chars | Enterprise; SharePoint sources |
| Mistral Le Chat | ~4000 chars | Concise preferred |
| Generic/API | Model-dependent | Max flexibility |

## Core Structure

## Role - WHO the agent is
## Mission - WHAT it does
## Context - WHY it exists
## Behavior Rules - HOW it acts
## Output Format - HOW it responds
## Constraints - WHAT it refuses

## Workflow
1. Intake: platform, purpose, persona, capabilities, limits, language
2. Draft using Role-Mission-Context-Behavior-Output structure
3. Quality check: role clear, rules unambiguous, format specified, limits explicit
4. Deliver: prompt + char count + starter message
5. Iterate surgically

## Platform Selection
- File uploads / knowledge base: Custom GPT or Claude Project
- Google Workspace: Gemini Gem
- Microsoft 365: Copilot Agent
- API / developer: Generic system prompt
- Client-facing branded: Custom GPT

## Anti-Patterns
- Vague persona: always specify domain
- Implicit tone: state explicitly
- Missing scope limits: always add a do-not rule
- No output format: always specify language and structure

See references/platforms.md and references/nodeflow-agent-patterns.md
