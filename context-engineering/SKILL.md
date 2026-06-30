---
name: context-engineering
description: >
  Design the informational environment around Claude to get better outputs —
  not by rewriting prompts, but by improving what the model sees when it decides.
  Use when Claude is giving vague, wrong, or inconsistent answers despite good
  prompts; when building multi-step or agentic workflows; when debugging why an
  agent fails mid-pipeline; when designing retrieval (RAG), memory boundaries,
  or tool output formatting. Also triggers when the user asks about context
  windows, context layers, retrieval quality, context vs prompt engineering,
  why Claude ignores instructions, or how to structure information for an LLM.
  Core principle: context first, prompt second.
---

# Context Engineering

## Core distinction

**Prompt engineering** — improve how Claude interprets the task (wording,
instructions, format).

**Context engineering** — improve what Claude knows when it interprets the task
(retrieval, memory, evidence, tool outputs, ordering).

A strong prompt cannot fix bad context. If the model is reading the wrong
things, better wording only makes the wrong answer sound more confident.

---

## The 7 inputs Claude sees

Everything that reaches the model shapes its next decision:

| Input | What it is |
|---|---|
| System instructions | Role, tone, persona, rules |
| User request | The direct question or task |
| Prior turns | Conversation history, chat logs |
| Retrieval (RAG) | External documents, knowledge bases |
| Memory | User profile, preferences, long-term context |
| Tool outputs | API results, code execution, calculations |
| Constraints & limitations | Safety filters, output format, length, business rules |

Most failures happen not in the prompt but in one of these other inputs.

---

## The 5-layer context model

Think in layers, not as one blob:

```
1. INSTRUCTION LAYER
   Directives from the user — specific tasks, goals, framing

2. EVIDENCE LAYER
   Current inputs & external data — the prompt, attached files,
   real-time knowledge, search results

3. MEMORY LAYER
   Previous context & past interactions — conversation history,
   user preferences, long-term recall

4. CONSTRAINT LAYER
   Rules, limitations & ethics — safety guidelines, output formatting,
   tone restrictions, ethical bounds

5. EVALUATION LAYER
   Output quality & alignment check — verifying against goals,
   fact-checking, ensuring constraints are met
```

Once you think in layers, prompt engineering becomes one part of a broader
context architecture — not the whole job.

---

## How weak context cascades through an agentic system

One bad context step poisons everything downstream:

```
1. WEAK INITIAL CONTEXT
   Vague prompt, missing information, incomplete user intent
         ↓ propagates errors
2. IMPACT ON INFORMATION RETRIEVAL
   Inefficient search queries, ignoring critical data sources,
   gathering wrong or noisy information
         ↓ continues the chain
3. DISTORTED REASONING & PLANNING
   Incorrect assumptions, flawed sequence of steps,
   failure to recognize the real problem
         ↓ drives misaligned actions
4. INEFFECTIVE TOOL USE & EXECUTION
   Wrong tools selected, bad API parameters, wasted resources
         ↓ cumulative negative output
5. POOR FINAL RESULT
   Low accuracy, failure to fulfil the request, reduced user trust
```

This is why agentic systems fail in ways that seem mysterious. The root cause
is almost always in Step 1 or 2, not in the model's reasoning at Step 3-5.

---

## Context-engineering decision flow

```
START
  ↓
Gather context & define objectives
  ↓
Is retrieval quality high?
  ├── NO → Refine search strategy / sources → loop back
  └── YES
        ↓
        Filter noise & irrelevant info
        ↓
        Organize & structure the data
        ↓
        [PROMPT ENGINEERING PHASE]
        Draft initial prompt
        ↓
        Does prompt use tools?
        ├── YES → Are tool outputs clear?
        │         ├── NO → Refine tool definitions & schema
        │         └── YES ↓
        └── NO ↓
              Is context / memory stale?
              ├── YES → Refresh or update data sources → loop back
              └── NO
                    ↓
                    Combine context + tool data
                    ↓
                    Final prompt review & refinement
                    ↓
                    Ready for testing & execution
```

**Context first. Prompt second.** Always in that order.

---

## The 5 areas to improve

### 1. Retrieval quality
Does Claude receive the right information?

- Relevant documents (not everything in the knowledge base)
- Useful chunking — not too large, not too small
- Good metadata filtering
- Strong ordering — most relevant first
- Remove noisy or duplicate material

Weak retrieval forces the model to guess. Polished but unreliable outputs follow.

### 2. Context ordering
Order affects what Claude weights most.

- Instructions → Evidence → Examples → Tool results (typical good order)
- Group related information together
- Separate clearly what is instruction vs. what is source material
- Summarize long sources before passing them in

### 3. Memory boundaries
Not everything should stay in context forever.

Define for each piece of state:
- **Persist** — still relevant to current task
- **Expire** — no longer needed, remove it
- **Summarize** — compress before keeping
- **Re-retrieve** — fetch fresh instead of remembering stale version

Appending state without deciding what still matters degrades quality fast.

### 4. Tool output formatting
A tool can return the right data in the wrong shape.

- Clean tool responses before passing to Claude
- Summarize important fields, remove irrelevant keys
- Add labels so Claude knows what each value means
- Highlight the exact values Claude should use
- Avoid raw logs, dense JSON, or conflicting field names

### 5. Multi-step decomposition
Sometimes one context window is not the right place to solve everything.

```
Step 1: Retrieve relevant material
Step 2: Summarize only the useful evidence
Step 3: Pass summary into answer-generation
Step 4: Evaluate the final response
```

Each step has a focused, clean context. The model reasons well because it is
never overloaded.

---

## Context quality by use case

| Workflow | What Claude needs |
|---|---|
| Support / customer service | Account details, policy excerpts, prior ticket history, product docs |
| Coding assistant | Relevant files only, architecture notes, coding conventions, test results |
| Research | Recent sources, evidence grouping, conflict detection, citation boundaries |
| Document extraction | Extracted fields, schema rules, ambiguous sections flagged, validation constraints |
| Agentic workflow | Clear task state, tool results formatted for reasoning, memory of completed steps |

Context engineering is workflow-specific design, not a universal prompt trick.

---

## The "context first" checklist

Before rewriting the prompt, check:

- [ ] Do we have the right source material?
- [ ] Is the retrieval relevant and recent?
- [ ] Are we passing too much noise?
- [ ] Is the context ordered in a useful way?
- [ ] Are tool outputs readable and prioritized?
- [ ] Is stale memory still hanging around?
- [ ] Would this work better as a two-step or three-step flow?

Then check the prompt:

- [ ] Is the task narrow enough?
- [ ] Are constraints explicit?
- [ ] Is the output format defined?

---

## Weak context vs. strong context — example

**Great prompt, weak context**
```
Write a high-quality customer response using a warm, professional tone.
Be concise, accurate, and helpful.
```
Claude has no access to: customer's plan, product limitation, refund policy,
account history. Result: polished but vague or wrong.

**Good prompt, strong context**
Claude receives: customer message + correct documentation section + refund
policy excerpt + account status + previous support exchange + short style note.
Result: output is grounded, specific, ready to send.

The prompt in case B may be simpler. The output is better because Claude is
deciding from a stronger informational base.

---

## Common mistakes

| Mistake | Why it hurts | Fix |
|---|---|---|
| More context = better output | Noise degrades prioritization and creates contradictions | Include what matters, exclude what distracts |
| Rewriting prompt to fix a context problem | Makes wrong answer sound more confident | Debug context first |
| Keeping all state in memory forever | Stale context poisons later reasoning | Define expire/summarize rules |
| Passing raw tool output | Model struggles with dense JSON or noisy logs | Clean and label before passing |
| One giant prompt for everything | Context overload → poor prioritization | Decompose into stages |
