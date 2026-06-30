---
name: self-improving-loop
description: >
  Build a loop that improves its own process between runs — not just the output.
  Use when the user wants an agent that compounds over time: remembers lessons
  across runs (self-journal.md), grades output with a fresh skeptical subagent
  (honest-grader), rewrites its own rules when the same weakness appears twice
  (self-rules.md), and stops when improvement converges (/improve command).
  Also triggers for: self-journal, honest-grader, convergence stop condition,
  GEPA, failure classification, signal taxonomy, or "make the agent learn from
  its own mistakes". Does NOT cover single-task /goal or /loop interval — see
  loop-engineering for that.
---

# Self-Improving Loop

## Core idea

A normal loop improves the **output**. A self-improving loop improves the **loop**.
It engineers itself between runs: remembers what worked, grades itself without
flattery, rewrites its own rules, and stops when improvement converges.

Four abilities make this work. Each is a small loop of its own.

---

## The four abilities

### 1. Memory across runs — `self-journal.md`

An agent that forgets every run can't improve. The journal is append-only, read
first at the start of every run.

```markdown
# self-journal.md  (append-only, 3 lines per run)

## Run 14
tried: parallel fetch to speed up the report
result: faster, but rate-limited at 50 rows
lesson: batch in chunks of 25, not all at once
```

**Rule:** Read `self-journal.md` before doing anything. Never rediscover a dead
end already paid for. The other three abilities build on this.

---

### 2. Honest self-grading — `honest-grader` subagent

An agent left to judge itself almost always praises its own output, even when
quality is mediocre. Separate the doing from the judging.

Create `.claude/agents/honest-grader.md`:

```yaml
---
name: honest-grader
description: Scores the loop's output. Assumes it has flaws.
tools: Read, Grep, Bash
model: claude-sonnet-4-6
---

You did not produce this work. Assume it has gaps.
Score it 0-100 against the goal, then list the single
biggest weakness. Do not praise. Do not soften.
A 70 you can defend beats a 95 you can't.
```

The grader is always a fresh context — never the same agent that did the work.
Honest grading points self-improvement in the right direction.

---

### 3. Self-tuning rules — `self-rules.md`

When the journal and grader agree a weakness keeps appearing, the loop updates
its own instructions. Add this rule to the loop charter:

```markdown
## Self-tuning rule

When the grader flags the same weakness twice across runs,
do not just fix the output. Fix the instruction that let it happen:
- add the missing rule to self-rules.md
- or rewrite the task prompt to prevent it up front

Then note the change in the journal. You are editing how you
work, not just what you produced.
```

A normal agent fixes the bug. A self-improving one fixes the **reason the bug
was possible**. Over time `self-rules.md` becomes a playbook written by the
loop, for the loop.

---

### 4. Stop condition — convergence rule

Self-improvement without a stop condition burns tokens chasing tiny gains.

```markdown
## Stop rule

Track the grader's score each run.
- Score hit the goal: stop, success.
- Score improved < 5% for two runs straight: stop, converged.
- Same weakness three runs running: stop, escalate to the user.

Improving forever isn't the goal. Improving until it's good
enough, then stopping, is.
```

---

## The `/improve` command

Wire all four abilities into a single command.
Create `.claude/commands/improve.md`:

```yaml
---
description: Run a task in a self-improving loop
argument-hint: <task>
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
model: claude-sonnet-4-6
---

Task: $ARGUMENTS

1. READ self-journal.md and self-rules.md first. Don't repeat
   a known dead end.
2. DO the task using what you've learned.
3. GRADE it with the honest-grader subagent. Record the score.
4. If the same weakness keeps appearing, TUNE your own rules,
   not just the output.
5. WRITE the run to the journal: tried, result, lesson.
6. STOP when the score converges or hits the goal.
```

Run with: `/improve <describe the task>`

---

## What it looks like in practice

```
Run 1   score 64   lesson logged: validate input early
Run 2   score 79   read journal, skipped the old mistake
Run 3   score 88   grader flagged weak error handling (2nd time)
        → tuned self-rules.md: "wrap every call in try/catch"
Run 4   score 91   new rule applied from the start
Run 5   score 92   +1, converged. stop.
```

By run 4 the loop starts from rules it wrote in run 3. It didn't just do the
task better — it rebuilt how it approaches the task.

---

## 15-minute setup

| Step | Time | File |
|------|------|------|
| Create journal template | 3 min | `self-journal.md` |
| Build honest-grader subagent | 4 min | `.claude/agents/honest-grader.md` |
| Add self-tuning rule to charter | 4 min | loop charter or `self-rules.md` |
| Add convergence stop rule | 2 min | loop charter |
| Wire `/improve` command | 2 min | `.claude/commands/improve.md` |

---

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Agent grades its own work | Always use `honest-grader` — fresh context, no praise |
| Fixing outputs but not instructions | When weakness repeats, update `self-rules.md` |
| No stop condition | Score converged or same weakness 3× → stop |
| Journal nobody reads | Read `self-journal.md` first, every run, before doing anything |

---

## Failure classification — decision tree

When evaluation fails, classify the failure before retrying. Wrong diagnosis =
wrong fix = wasted attempt.

```
Agent Evaluation
      ↓
  ┌───┴───────────────────────────────────┐
PASS   FAIL: Missing   FAIL: Tool   FAIL: Low    FAIL:
       Context         Error        Confidence   Recoverable
  ↓         ↓              ↓             ↓            ↓
Finalize  Retrieve      Revise        Escalate     Retry
          More          Action        to user      with memory
```

| Failure type | Cause | Next action |
|---|---|---|
| Missing context | Agent lacked info to act correctly | Retrieve more — docs, files, prior state |
| Tool error | Tool call broke or returned wrong fields | Revise the action — fix arguments or switch tool |
| Low confidence | Agent unsure, output unreliable | Escalate — don't guess on high-stakes tasks |
| Recoverable issue | Transient error (rate limit, timeout) | Retry with same context + note in journal |

---

## The 4 prompt templates

Ready to use. Drop into the loop charter or `/improve` command.

### Prompt 1 — Evaluation-aware action
```
You are executing a task inside a bounded workflow.
Your goal is not just to produce an answer, but to produce an answer
that will pass evaluation.
If information is missing, ask for it or retrieve it.
If the result is uncertain, do not finalize confidently.
If a previous attempt failed, avoid repeating the same strategy
unless the context changed.
```

### Prompt 2 — Failure diagnosis
```
The previous attempt failed.
Classify the likely failure reason into one of these categories:
- missing context
- tool misuse
- bad assumption
- incomplete output
- formatting or schema failure
- policy conflict

Then propose the smallest next change that improves the odds of success.
```

### Prompt 3 — Revision
```
Revise the next attempt using the evaluator feedback below.
Do not repeat the same reasoning path if it already failed.
Prefer a narrower, more grounded solution.
If needed, retrieve more context before answering.
```

### Prompt 4 — Memory summary
```
Summarize the last attempt into a short memory block for the next run.
Include only:
- what failed
- what worked
- what should be avoided
- what should be tried next
Keep it under 120 words.
```

---

## Signal taxonomy — what to use as improvement signals

Not all signals are equal. Combine at least two categories.

| Category | Examples |
|---|---|
| **Deterministic** | Tests pass/fail, schema validates, API returns 200, required fields present |
| **Workflow** | Retry count, tool latency, step where failure occurred, escalation frequency |
| **Human** | Thumbs up/down, corrected output, accepted vs rejected draft, reviewer notes |
| **Comparative** | Version A vs B output quality, score improvement over runs, tool path comparison |

Feed wrong signals → agent optimizes in wrong direction. Deterministic signals
are the most reliable baseline. Add human signals when stakes are high.

---

## Build sequence — 8 steps in order

Build in this order. Do not skip to step 5 before step 3 exists.

1. **Define success** — what does a good result look like? Be specific and measurable.
2. **Classify failure categories** — why does this agent usually fail? Name them.
3. **Build the evaluator first** — how will the system know it succeeded or failed?
4. **Design memory rules** — what persists between attempts? Compress, don't dump.
5. **Define retry strategy** — what changes between attempt 1 and attempt 2?
6. **Add escalation logic** — when should a human step in?
7. **Log everything important** — you cannot improve what you do not observe.
8. **Optimize only after the loop works** — do not overcomplicate before the core cycle is stable.

---

## Self-improving agent checklist

Before calling an agent "self-improving", verify:

- [ ] Agent knows what success looks like
- [ ] It evaluates each attempt (not just produces output)
- [ ] It stores useful lessons from failure
- [ ] It changes strategy based on feedback
- [ ] It avoids repeating the same failed path blindly
- [ ] It knows when to stop
- [ ] It knows when to escalate to a human
- [ ] You can measure whether it is actually getting better

If most are missing, the system is iterative — not self-improving.

---

## Relation to `/goal` and `/loop`

| | `/goal` | `/loop` | `/improve` |
|-|---------|---------|------------|
| Finish condition | Goal met | Never (rhythm) | Score converged |
| Learns across runs | No | No | Yes — journal + rules |
| Rewrites own rules | No | No | Yes |
| Best for | Finish this pile | Repeat on schedule | Get better over time |

Use `/improve` when the task repeats and quality matters over time.
Use `/goal` when there's a single finish line.
Use `/loop` when there's a recurring beat.
