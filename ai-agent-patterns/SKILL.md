---
name: ai-agent-patterns
description: >
  Select and explain the right AI agent design pattern for a given use case.
  Use when the user wants to design the architecture of an AI agent system,
  choose between agent patterns, understand how to structure multi-agent workflows,
  or decide between patterns like sequential, parallel, loop, swarm, ReAct,
  hierarchical, coordinator, reflexion, plan-and-execute, human-in-the-loop,
  event-driven, or custom logic. Also triggers when the user asks "what pattern
  should I use for my agent?", "how should I structure this AI workflow?",
  or "which agent architecture fits this use case?".
---

# AI Agent Design Patterns

## Overview
15 established patterns for designing AI agent systems. Select the right pattern
based on the task structure, complexity, need for human oversight, and whether
subtasks are independent or dependent.

---

## The 15 Patterns

### 1. Single Agent
**Structure:** One LLM handles everything end-to-end.
**Use when:** Task is self-contained, low complexity, no need for specialization.
**Example:** A customer support bot that answers FAQs.
**Tradeoff:** Simple to build and debug; hits limits on complex multi-step tasks.

---

### 2. Sequential
**Structure:** Output of Agent A → input of Agent B → input of Agent C → ...
**Use when:** Tasks have a clear linear pipeline where each step depends on the previous.
**Example:** Research → Draft → Edit → Publish pipeline.
**Tradeoff:** Easy to reason about; a failure in one step blocks all downstream steps.

---

### 3. Parallel
**Structure:** Multiple agents run simultaneously on independent subtasks; results merged.
**Use when:** Subtasks are independent and can be executed concurrently to save time.
**Example:** Simultaneously summarizing 5 documents, then combining summaries.
**Tradeoff:** Fast; requires a merge/aggregation step; harder to debug race conditions.

---

### 4. Loop
**Structure:** Agent runs → evaluates output → decides to repeat or stop.
**Use when:** The agent needs to retry, refine, or iterate until a condition is met.
**Example:** Code generation that runs tests and loops until all tests pass.
**Tradeoff:** Can self-correct; risk of infinite loops — always set a max iteration limit.

---

### 5. Review & Critique
**Structure:** Generator agent produces output → Critic agent reviews it → Generator revises.
**Use when:** Output quality matters and errors are costly (legal, medical, financial).
**Example:** One agent writes a contract clause; another checks for legal risks.
**Tradeoff:** Higher quality output; doubles token cost; critic needs to be well-prompted.

---

### 6. Iterative Refinement
**Structure:** Agent produces draft → receives feedback (human or automated) → refines → repeat.
**Use when:** Quality improves through multiple passes with explicit feedback signals.
**Example:** Design generation refined through user feedback rounds.
**Tradeoff:** Produces polished output; requires well-defined feedback criteria.

---

### 7. Coordinator
**Structure:** Central coordinator agent dispatches subtasks to specialized worker agents.
**Use when:** Task has multiple dimensions requiring different expertise.
**Example:** A coordinator routes to a legal agent, a financial agent, and a writing agent.
**Tradeoff:** Clean separation of concerns; coordinator is a single point of failure.

---

### 8. Hierarchical Decomposition
**Structure:** Top-level agent breaks task into subtasks → delegates to sub-agents → aggregates results.
**Use when:** Task is too large for one agent; can be decomposed into a tree of subtasks.
**Example:** "Build a full report" → decomposed into research, analysis, and writing sub-agents.
**Tradeoff:** Scales to complex tasks; harder to maintain consistency across levels.

---

### 9. Swarm
**Structure:** Multiple peer agents collaborate, share context, and self-organize around a goal.
**Use when:** Problem benefits from diverse perspectives or parallel exploration without central control.
**Example:** Multiple agents explore different strategies for a business problem and vote on the best.
**Tradeoff:** Robust and creative; expensive; coordination overhead; emergent behavior is hard to predict.

---

### 10. ReAct (Reason + Act)
**Structure:** Agent alternates between reasoning (thought) and acting (tool call) in a loop.
**Use when:** Task requires using external tools (search, APIs, databases) guided by reasoning.
**Example:** Research agent that thinks, searches the web, reads results, thinks again, acts.
**Tradeoff:** Transparent reasoning trace; token-heavy; requires reliable tool execution.

---

### 11. Human-in-the-Loop
**Structure:** Agent runs autonomously but pauses at defined checkpoints for human approval.
**Use when:** High-stakes actions (sending emails, financial transactions, publishing content).
**Example:** AI drafts a customer email → human reviews → human approves → AI sends.
**Tradeoff:** Safe for irreversible actions; breaks full automation; latency depends on human response time.

---

### 12. Plan-and-Execute
**Structure:** Planner agent creates a full plan upfront → Executor agent carries out each step.
**Use when:** Task requires upfront strategy before execution; plan benefits from being reviewed.
**Example:** AI plans a multi-week project roadmap, then executes each milestone sequentially.
**Tradeoff:** Clear separation of strategy and execution; plan may become stale as execution reveals new info.

---

### 13. Reflexion
**Structure:** Agent acts → reflects on its own output and errors → generates improved version.
**Use when:** Self-evaluation is possible and the agent can identify its own mistakes.
**Example:** Coding agent that writes code, runs it, reads the error, reflects, and rewrites.
**Tradeoff:** Strong self-improvement loop; requires the agent to be good at self-critique; risk of hallucinated self-assessment.

---

### 14. Custom Logic
**Structure:** Agent behavior is governed by explicit business rules, decision trees, or guardrails defined in code.
**Use when:** Domain has strict compliance requirements or non-negotiable business rules.
**Example:** Insurance claims agent that must follow exact regulatory decision paths.
**Tradeoff:** Predictable and auditable; requires upfront rule design; less flexible to edge cases.

---

### 15. Event-Driven Agent
**Structure:** Agent is triggered by external events (webhooks, messages, schedules) and reacts autonomously.
**Use when:** Agent should run in the background and respond to real-world triggers.
**Example:** Agent monitors a Slack channel and automatically creates Jira tickets from bug reports.
**Tradeoff:** Fully autonomous and reactive; harder to test; requires robust error handling for edge events.

---

## Pattern Selection Guide

| Scenario | Recommended Pattern(s) |
|----------|------------------------|
| Simple, one-shot task | Single Agent |
| Linear pipeline (A → B → C) | Sequential |
| Independent subtasks, need speed | Parallel |
| Self-improving until quality threshold | Loop, Reflexion, Iterative Refinement |
| Output needs quality review | Review & Critique |
| Multiple specialized tools/domains | Coordinator, Hierarchical Decomposition |
| High-stakes / irreversible actions | Human-in-the-Loop |
| External triggers (webhooks, events) | Event-Driven Agent |
| Tool use + reasoning interleaved | ReAct |
| Upfront planning required | Plan-and-Execute |
| Strict compliance / business rules | Custom Logic |
| Complex problem, diverse perspectives | Swarm |

## Combining Patterns

Patterns are composable. Common combinations:
- **ReAct + Loop**: agent reasons and uses tools, loops until confident
- **Coordinator + Parallel**: coordinator dispatches workers that run in parallel
- **Plan-and-Execute + Human-in-the-Loop**: plan reviewed by human before execution begins
- **Hierarchical + Review & Critique**: sub-agents produce output, critic agent validates before aggregation
- **Event-Driven + Sequential**: event triggers a sequential pipeline

## Output format

When the user asks which pattern to use, respond with:
1. **Recommended pattern(s)** — name + one-line justification
2. **Architecture sketch** — simple text diagram showing the flow
3. **Key risks** — what can go wrong with this pattern in their specific context
4. **Alternative** — second-best pattern and when to switch to it
