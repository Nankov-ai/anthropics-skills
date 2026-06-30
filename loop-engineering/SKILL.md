---
name: loop-engineering
description: >
  Design and run autonomous Claude Code loops using /goal and /loop commands.
  Use when the user wants to automate a repetitive multi-step task, run work
  overnight or on a schedule, verify sources or links automatically, process
  a backlog of items, or stop babysitting Claude turn by turn. Also triggers
  for: /loop with an interval (e.g. /loop 5m /command), loop charter,
  LOOP-STATE.md, /goal command, self-checking loops, or wanting Claude to
  "keep working until done". Does NOT cover self-improvement across runs or
  honest-grader — see self-improving-loop for that.
---

# Loop Engineering

## Core concept

**You are the loop right now.** You type → Claude acts → you check → you decide next step → repeat.
Loop engineering replaces you in that cycle. Claude finds the work, does it, checks itself, remembers where it left off, and goes again — until done or until it needs a decision only you can make.

**Prompting = doing the work. Loop engineering = managing the worker.**

---

## The two commands

### /goal — loop that works until done
Use when there's a finish line. Claude works turn after turn, and after each turn a second Claude quietly checks: *are we at the goal yet?* If not, it explains why and work continues. Stops when the goal is met.

```
/goal write a one page brief on [topic]
where every claim has at least three sources and
every link opens to a real page that supports the claim.

Open each link to confirm it before you call it done.
Replace any source that is dead or does not back up the claim.
Stop only when every source on the page checks out.
```

**Use /goal when:** finish this pile of work / work until this condition is true.

### /loop — loop that repeats on a rhythm
Use when there's no finish line, just a recurring beat.

```
/loop 30m check whether my live site is back up by loading the homepage.
The moment it returns a normal page, tell me and stop checking.
```

Interval formats: `30s`, `5m`, `1h`, or omit to let Claude self-pace.

**Use /loop when:** check this again and again / run this every morning.

---

## The five beats of every loop

1. **Find the work** — open tasks, failing tests, files in a folder, items in a list
2. **Do it** — Claude handles one item at a time, like you would by hand
3. **Check itself** — a second pass confirms work is done and correct, not just produced
4. **Remember** — writes down what's finished so it never repeats or loses its place
5. **Go again** — repeats until nothing's left, then stops or pings you

---

## The charter template

For any loop with multiple steps, give Claude a full charter. Fill in the brackets:

```
You are running as a loop, not answering one prompt. Here is your charter.

GOAL
[Describe the finished state in one or two sentences.
Be specific about what DONE looks like, and make it something you can measure.
Example: "Every product page in /pages has the new pricing and every link opens."]

WHERE THE WORK IS
[Tell Claude where to look.
Examples: "Scan the /pages folder for files with old pricing."
Or "Read TODO.md and treat each unchecked box as a task."
Or "Check my connected task board for items tagged ai."]

HOW TO WORK
- Do one item at a time. Finish it fully before starting the next.
- Match the patterns you find in existing files. Do not invent new ones.
- If an item needs a decision only I can make (spending money, deleting things,
  emailing a person), stop on that item, add it to a "needs me" list, and move
  to the next one.

HOW TO CHECK YOURSELF
After each item, prove it is done before you mark it done.
[Pick what fits: "run the tests" / "re-read the file and confirm it meets the
goal" / "open the link and confirm it loads."]
Checking means evidence, not confidence.
If the check fails, fix it and check again. Three tries per item, then log it
as blocked and move on.

HOW TO REMEMBER
Keep a file called LOOP-STATE.md.
After each item, write: item name, status (done / blocked / needs me),
what you changed, and anything the next run should know.
Read this file FIRST every run so you never redo finished work.

WHEN TO STOP
Stop when every item is done or logged as blocked, or when you have finished
[N] items this run.
Then give me a short report: what got done, what is blocked, what needs my call.

Start by reading LOOP-STATE.md if it exists, then find the work.
```

**LOOP-STATE.md is the quiet hero.** Without it, every run starts from zero. With it, the loop picks up exactly where it left off, even when it runs on a schedule.

---

## Source verification loop (example)

Classic use case — Claude hallucinates sources and doesn't know it:

```
/goal write a one page brief on [topic].
Every claim needs at least three sources.
Every link must open to a real page that backs up the claim.
Open each link to confirm it. Throw out dead or fake ones and find real replacements.
Stop only when every source on the page checks out.
```

Claude never gets bored. It never skips the boring link checks.

---

## When NOT to use a loop

- **One-off tasks** — a single answer is faster with a plain prompt
- **Vague goals** — "think of a better strategy" is not a loop; define the actual goal first
- **Cost awareness** — a self-checking loop runs Claude multiple times per item; usage limits are hit faster on any Claude plan

---

## Loop vs cron job

| | Cron job | Loop |
|---|---|---|
| Runs | Fixed script | Claude |
| Decision-making | None | Yes — looks at situation, picks next action |
| Handles failures | No | Yes — can retry, undo, try different approach |
| Requires setup | Minimal | Charter or /goal prompt |

The decision-maker inside the loop is the entire point. A script can't look at a broken test and figure out a different fix. Claude can.

---

## When to reach for a loop

Ask yourself: *am I the one deciding the next step every time?*
If yes — you are the loop. Write a charter and hand it off.

Best candidates:
- Tasks with many small similar pieces (update all pages, check all links, process all files)
- Work that repeats on a schedule (morning inbox triage, nightly deploy check)
- Multi-step verification (write + check + fix + verify cycle)
- Anything you keep doing by hand that has a clear "done" state
