---
name: agent-prompt-builder
description: >
  Use this skill to create, structure, and optimize system prompts for AI agents across
  any platform: Google Gemini Gems, OpenAI Custom GPTs, Claude Projects, Copilot Agents,
  Mistral Le Chat agents, or any LLM-based assistant. Also covers no-code app builder
  prompts for Lovable, Bolt, v0, and similar vibe-coding tools. Triggers when the user
  wants to build a GPT, create a Gem, write a system prompt, design an AI assistant,
  create an agent, improve, audit, translate, or convert an existing system prompt between
  platforms — or when they want to build an app in Lovable/Bolt/v0 and need a structured
  prompt with design hand-off, screen specs, tech stack, and functional requirements.
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

---

## No-code app builder prompts (Lovable / Bolt / v0)

Use when the user wants to build a mobile or web app in a vibe-coding tool.

### The hand-off package (prepare before prompting)
A good Lovable prompt starts with assets, not words:
```
assets/          ← original photos, brand images, icons
README.md        ← functional spec: what the app does, screens, features
index.html       ← visual reference: layout, colors, typography prototype
```

Give the AI the files **and** the prompt together. The files are the source of truth.

### Lovable prompt structure
```
Build a [platform: mobile-first / web] app called "[Name]" using as primary
reference the files I attached: README.md, index.html, and [N] photos/assets.

**Objective:** [One sentence: what experience does this create? What is it NOT?]

**Very important:** Do not copy index.html as a WebView. Use it only as exact
visual reference to recreate the screens inside Lovable with real components,
clean code, [React / TypeScript / Tailwind / framework].
Use README.md as functional and visual specification.

**The app must have [N] main screens:**

1. [Screen name]
[What it shows, key elements, interactions, navigation]

2. [Screen name]
[...]

**Navigation:** [Tab bar / drawer / stack — describe tabs and what each does]

**Design:**
- Background: [hex] and secondary [hex]
- Primary color: [hex] and dark variant [hex]
- Typography: [Font] for titles, [Font] for body, [Font] for handwritten notes
- Components: rounded cards, pill buttons, large editorial photography

**Features:**
- [Feature 1: e.g. favorites, search, timer, shopping list]
- [Feature 2]
- Local persistence with localStorage
- Language: [Portuguese PT / English / ...]

After building the first version, verify: all main buttons work, navigation
between screens works, [key feature] works, design is premium and close to
the visual reference.

Note: Attach files (README, index.html, photos)
```

### Quality check after first build
Ask Lovable to verify before calling it done:
```
Verify: (1) all main buttons work, (2) navigation between screens works,
(3) [specific feature] works correctly, (4) design matches the visual reference,
(5) all text is in [language].
```

### Anti-patterns for no-code builders
| Mistake | Fix |
|---|---|
| Describing design in words only | Attach index.html as visual reference |
| One giant vague prompt | Break into: objective → screens → design → features |
| No tech stack specified | Always state React/TypeScript/Tailwind or equivalent |
| Asking to "copy" the HTML file | Say "use as visual reference, not as WebView" |
| No verification step | Always end with explicit check list |
