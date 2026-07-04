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

## Superagent prompts (Manus and similar autonomous agents)

Use when prompting a **superagent** — an AI that can autonomously browse, write code,
create files, and complete multi-step tasks from a single detailed instruction.

Unlike Lovable (which requires 6+ sequential prompts), a superagent receives **one
complete prompt** and works autonomously until the task is done.

### Key difference vs standard prompts

| Lovable / GPT | Manus / Superagent |
|---|---|
| Iterative: prompt → review → next prompt | One shot: full spec upfront |
| You guide each step | Agent decides the steps |
| Forgiving of vague instructions | Vague = wrong result |
| Good for creative exploration | Good for well-defined deliverables |

### Superagent prompt structure

```
[TASK TYPE] — state what you want built in one sentence.

**Tech stack:** [React + Vite + TypeScript + Tailwind / Python + FastAPI / etc.]
No external UI libraries. Everything in a single file [App.tsx / main.py / etc.].

**SETUP**
[Fonts, global CSS, page title, base configuration]

**STRUCTURE**
[Sections / pages / screens — list each with its content and purpose]

**COMPONENTS**
[Key UI elements: navbar, hero, cards, forms — describe behavior and layout]

**DATA**
[Constants, sample data, any hardcoded values the agent needs]

**INTERACTIONS**
[Animations, transitions, scroll behavior, responsive breakpoints]

**DESIGN RULES**
[Colors, typography, spacing, responsiveness, language]

After completing, verify: [list 3–5 specific things to check before delivering]
```

### Example: single-prompt landing page
```
Create a landing page for a dental clinic using React + Vite + TypeScript +
Tailwind CSS. No external UI libraries. Everything in a single App.tsx file.
3 full-screen sections, fixed navbar, loading animation.

SETUP
Font: "Open Sauce One" via <head> links.
Title: "Dental Care — Quality Care"
Global CSS: @tailwind base/components/utilities, height 100%, font-family Open Sauce One.

STRUCTURE
Section 1 HERO: headline "Specialists in professional smiles", subtitle "Free consultation",
CTA button "Book Now".
Section 2 GALLERY: 3-column grid with smile transformation photos.
Section 3 SERVICES: Veneers / Whitening / Implants with icons and descriptions.

COMPONENTS
Navbar: fixed top, logo left, menu right, hamburger mobile, blur backdrop.
AnimReveal: fade-in + translateY on scroll, 0.6s cubic-bezier, staggered delay.
MaskedCard: shared background image across sections for cohesive visual effect.

DESIGN RULES
Responsive to 768px. Portuguese language. Border-radius 1rem on cards.
Typography: clamp(3rem, 11vw, 11rem) for hero headline.

Verify: (1) all 3 sections render, (2) navbar scrolls correctly, (3) mobile
hamburger works, (4) animations trigger on scroll, (5) all text in Portuguese.
```

### When to use a superagent vs sequential prompts
- **Superagent**: well-defined deliverable, technical spec is clear, output is a single artifact
- **Sequential (Lovable)**: creative exploration, iterative design, visual feedback needed at each step

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
