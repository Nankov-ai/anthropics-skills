---
name: vibecoding
description: >
  Guide for writing effective prompts to build apps and software with AI tools
  (ChatGPT, Claude, Gemini, Cursor, Lovable, Bolt, v0). Use this skill whenever
  the user wants to build something with AI by describing it in natural language —
  a web app, game, component, dashboard, automation, or any software project.
  Triggers on: "vibecoding", "quero criar uma app com IA", "como faço o prompt para
  construir X", "prompt para criar um jogo", "como pedir ao ChatGPT para programar",
  "preciso de uma app sem saber programar", "criar componente com IA", "prompt de
  arquitetura", "prompt de componente", "debug com IA", "refatorar com IA", or any
  request where the user wants to instruct an AI to write, build, or fix code.
  Also triggers when the user shares a prompt they wrote for a coding task and wants
  to improve it — prompt review is part of this skill.
---

# Vibecoding

Vibecoding is the practice of building software by describing what you want in
natural language, letting the AI write the code, and iterating until it works.

The quality of what you build depends almost entirely on the quality of your prompts.

---

## The 3 foundations of a good vibecoding prompt

### 1. Chain-of-Thought (CoT)
Ask the AI to show its reasoning before executing. This dramatically improves
accuracy on complex tasks.

Three ways to apply it:

| Technique | When to use | How |
|---|---|---|
| **Show full reasoning** | Complex logic, architecture decisions | "Explain your approach before writing any code" |
| **Decompose first** | Multi-step features | "Break this into subtasks, then solve each one" |
| **Action plan** | Large builds | "Create a step-by-step plan (Define → Analyze → Plan → Execute), then follow it" |

### 2. Delimiters and Markdown structure
Structure your prompt the way you want the AI to structure its response.

```
# Main objective

## Context
>>> Your specific context or data goes here <<<

## Requirements
- Requirement 1
- Requirement 2

## Constraints
- Must use [framework/library]
- Must NOT do [X]
```

Use `>>>text<<<` to mark content that must be included verbatim.
Use `#`, `##`, `###` to separate sections.
Use **bold** for emphasis on critical requirements.

### 3. Specificity over vagueness
Vague prompts produce generic code. Specific prompts produce working code.

| Vague | Specific |
|---|---|
| "Make a memory game" | "Create a 5x5 grid memory game with 12 emoji pairs + 1 extra, 2-second reveal phase, 60-second timer, top-10 leaderboard sorted by fewest errors then time" |
| "Style this component" | "Apply Tailwind CSS, mobile-first, breakpoints at 768px and 1024px, WCAG AA contrast" |
| "Fix this bug" | "Here's the full stack trace: [paste]. Node 18, React 18.2, Vite 5. Steps to reproduce: [list]" |

---

## The 8 prompt types

### 1. Architecture prompt
Use before starting any project of significant size.

**What to include:**
- Design pattern (MVC, microservices, monolith, component-based)
- Non-functional requirements (scale, performance, security)
- System context and constraints (existing stack, team conventions)

**Example:**
```
Design a microservices architecture for an e-commerce platform expecting 50K
concurrent users. Requirements: stateless services, JWT auth, PostgreSQL per
service. Constraints: must deploy on Google Cloud Run, no Kubernetes.
Show the service map, data flow, and API contracts before writing any code.
```

---

### 2. Component prompt
Use when building a specific UI or logic unit.

**What to include:**
- Expected input and output (with concrete examples)
- Dependencies and compatible libraries
- Code conventions (naming, file structure, types)

**Example:**
```
Build a React image upload component with preview.
Input: accepts image/* files up to 5MB.
Output: returns { file: File, previewUrl: string } via onChange prop.
Dependencies: React 18, TypeScript, no additional libraries.
Conventions: PascalCase components, props interface named [Component]Props.
```

---

### 3. Styling prompt
Use for CSS, layout, responsive design, and visual polish.

**What to include:**
- Visual reference (mockup, wireframe, existing URL, or description)
- Responsiveness requirements (breakpoints, mobile-first or desktop-first)
- CSS framework preference

**Example:**
```
Implement CSS for a responsive navbar following the attached mockup.
Mobile-first. Breakpoints: 768px (tablet), 1024px (desktop).
Use Tailwind CSS. Must meet WCAG AA (4.5:1 contrast ratio minimum).
Hamburger menu on mobile, horizontal links on desktop.
```

---

### 4. Security prompt
Use when implementing auth, data handling, or any user input processing.

**What to include:**
- Sensitive data involved (PII, financial, health)
- Regulatory requirements if any (GDPR, PCI-DSS)
- Explicit request for input validation and sanitization

**Example:**
```
Implement JWT authentication with protection against XSS and CSRF.
Users are EU residents — GDPR applies (no storing passwords in plain text,
consent for any analytics).
Validate and sanitize all form inputs. Use httpOnly cookies for token storage.
```

---

### 5. Refactoring prompt
Use when improving existing code without changing behavior.

**What to include:**
- The current code with specific problem areas highlighted
- Which aspect to optimize (performance, readability, or both)
- Success metric (e.g., "reduce execution time by 50%", "bring cyclomatic complexity below 10")

**Example:**
```
Refactor this function [paste code]. Problem: it runs in 120ms and is hard to test.
Goal: under 60ms, pure function, no side effects.
Do not change the public interface — same inputs, same outputs.
```

---

### 6. Debug prompt
Use when something is broken and you need to find and fix the cause.

**Three required elements:**
1. **Full error message** — paste the complete stack trace, not just the last line
2. **Environment context** — OS, language version, framework versions, relevant dependencies
3. **Steps to reproduce** — exact sequence that triggers the error, every time

**Example:**
```
Debug this memory error: [paste full stack trace]
Environment: Node 18.17, React 18.2, Vite 5.0, Windows 11
Steps to reproduce:
1. Upload any image > 2MB
2. Click "Preview"
3. Error appears immediately
Expected: image preview renders
Actual: crash with "Cannot read properties of undefined"
```

---

### 7. Architecture for a complete app (superagent / single-prompt)
Use when prompting an autonomous AI (Claude Code, Manus, Cursor Agent) that
will build the entire app from one prompt.

The AI needs the full spec upfront — it won't ask clarifying questions.

**Structure:**
```
[WHAT TO BUILD — one sentence]

**Tech stack:** [framework + language + styling]
Single file preferred unless complexity requires splitting.

**SETUP**
[Fonts, global CSS, page title, base config]

**STRUCTURE**
[Sections / screens — each with content and purpose]

**COMPONENTS**
[Key UI elements — describe behavior, not implementation]

**DATA**
[Constants, sample data, initial state]

**INTERACTIONS**
[Animations, transitions, responsive behavior]

**DESIGN**
[Colors, typography, spacing, language]

After completing, verify: [3-5 specific checks before delivering]
```

**Real example (memory game):**
```
Create a digital memory game in a single HTML file (no build step, no dependencies).

**SETUP**
Grid: 5×5 (25 positions). Pieces: 12 emoji pairs + 1 random extra.
Memorization phase: all pieces shown for 2 seconds, then flipped face-down.
Timer: 60 seconds, starts after memorization phase ends.

**MECHANICS**
Click 2 cards per turn. Correct pair: stays face-up. Wrong pair: flips back after 1s.
Win condition: all pairs found within 60 seconds.
On win: prompt for player name, record wrong attempts and total time.

**LEADERBOARD**
Top 10 players. Sort by: (1) fewest wrong attempts, (2) fastest time on tie.
Columns: Name | Wrong attempts | Time (seconds)
Persist in localStorage.

**DESIGN**
Clean, colorful, emoji as interactive buttons. Responsive (desktop + mobile).
"Restart Game" button always visible.

Verify: (1) memorization phase works, (2) timer counts correctly, (3) pairs match,
(4) leaderboard saves and sorts, (5) restart resets everything.
```

---

### 8. Document/data manipulation prompt
Use when asking AI to process, merge, or transform existing files.

**What to include:**
- What each file contains (don't assume the AI knows)
- Exact transformation required
- Verification step (how to confirm it worked)

**Example (from real session):**
```
I have two documents:
- File A (HTML): a course catalog with visual layout, ~80 courses
- File B (Markdown): a text list of all courses organized by category, ~95 courses

Task: update File A to include all courses and categories from File B.
Ignore the "hours" column from File B — only add course names and categories.
Final result must have exactly 95 courses in File A.
Verify: count the courses after updating and confirm the total.
```

---

## Managing your prompts

### Build a prompt library
Save every prompt that produced a good result. A good entry includes:
- The prompt itself
- What it produced
- Why it worked (the key decision behind it)

This compounds over time — you stop reinventing, you iterate on what works.

### Document the reasoning, not just the prompt
The prompt is the output. The thinking behind it is the asset.

For each significant prompt, note:
- Why this structure (not another)
- What constraint made the difference
- What you would change next time

### Version control for prompts
Treat prompts like code:
- Keep previous versions before changing them
- Note what changed and why
- If a new version performs worse, roll back

### Tools for managing prompts
- Simple: a folder of `.md` files, one per project or category
- With metadata: a Notion database or Obsidian vault
- For teams: a shared repo with PR-based additions

---

## Common failure patterns and fixes

| Problem | Cause | Fix |
|---|---|---|
| AI ignores half the requirements | Too many requirements in one prompt | Split into sequential prompts or use numbered list |
| Generic, boilerplate output | Prompt too vague | Add a concrete example of what "done" looks like |
| AI changes code that was working | No explicit scope boundary | Add "Do NOT change [X], [Y], [Z]" |
| Debug loop with no progress | Missing environment context | Always include versions + exact steps to reproduce |
| Inconsistent style across components | No design system reference | Establish design tokens in first prompt, reference them in all others |
| Works on desktop, broken on mobile | No responsive requirements stated | Always specify breakpoints and mobile behavior explicitly |

---

## Quick-start checklist

Before sending any vibecoding prompt, check:

- [ ] Did I state the tech stack explicitly?
- [ ] Did I give a concrete example of the expected output?
- [ ] Did I specify what NOT to do or change?
- [ ] For complex tasks: did I ask for a plan before execution?
- [ ] For UI: did I include responsive requirements?
- [ ] For data/files: did I describe what each file contains?
- [ ] Did I include a verification step at the end?
