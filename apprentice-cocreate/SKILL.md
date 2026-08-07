---
name: apprentice-cocreate
description: Use this skill for the *conversational and creative* patterns of co-creating with an AI chatbot — how to structure the back-and-forth itself, not the code/prompt engineering. Covers: interview-driven creation, multi-chatbot comparison, persona/roleplay conversations, genre remix, iterative critique loops, and similar exploratory techniques for building a story, game, simulation, illustrated story, or educational tool through conversation. Trigger on "how should I talk to the chatbot to build this together", "I want to co-create a story/game with AI", requests for creative prompting techniques, or when the user is stuck on how to structure the *conversation* (not the code) with a chatbot. Do NOT use for: well-specified software/app builds where the ask is really about prompt engineering for code (CoT, delimiters, tech stack, architecture — use `vibecoding` instead), unrelated business advice, questions about what a specific book is about, academic AI/ML theory, or general writing help with no chatbot-collaboration angle. If a request is genuinely both (e.g. "help me build a game with AI, don't know how to start"), lead with this skill for the conversation structure, and point to `vibecoding` for the actual code-prompt once the concept is clear.
---

# Co-creating with chatbots

This skill applies a set of recurring patterns for co-creating things with an AI chatbot — apps, games, stories, simulations, educational tools. It is not a fixed step-by-step method — it's a catalog of techniques that make chatbot co-creation more creative, more educational, and more likely to produce something genuinely good rather than generic. (Distilled from analyzing dozens of real chatbot co-creation projects documented in AI/education research — the user never needs to know or mention any source to benefit from it.)

## Why this matters

Most people either (a) write one long detailed spec and ask the chatbot to build the whole thing, or (b) type a vague one-liner and accept whatever comes back. Both leave a lot of value on the table. Applying one or more of the patterns below consistently does better — they're cheap to try and often turn a flat result into something surprising.

## How to use this skill

1. **Find out what the user actually wants to make** and with which chatbot(s), if not already clear. A game, a story, a small web app, a simulation, a teaching tool? Solo or with a specific chatbot already open?
2. **Pick 2-3 patterns below** that fit the goal — not all of them, that's overkill for a small project.
3. **Draft a ready-to-paste opening prompt** for the user's chatbot session, built from those patterns.
4. **Suggest one concrete next step** after the first response (e.g. "ask it to add sound next" or "now ask a second chatbot to critique this").

Don't just list the patterns at the user — pick and apply them to their specific idea.

## The patterns

### 1. Start absurdly simple, then layer up
Get the smallest possible working version first (a calculator with one operation, a game with no scoring) before asking for anything fancy. Successful co-creation projects almost always go through a "first, second, third version" arc. Adding media (images, sound, voice) is a *later* layer, not the first ask — bolting it on too early makes the chatbot juggle too much at once and the core idea suffers.

### 2. Guided, structured prompts beat one big ask
Instead of one paragraph trying to specify everything, give the chatbot a short structured brief: goal, constraints, what to avoid, and an explicit invitation to ask questions first. If the project has real technical depth (a proper app, not a small game/story), hand off to the `vibecoding` skill for the actual build prompt — its delimiter/CoT structure is the technical counterpart to this pattern.

### 3. Interview-driven creation
Ask the chatbot to interview *you* before it builds anything — "ask me whatever you need to know before generating this." This surfaces gaps in the user's own idea and produces a much better first draft than guessing.

### 4. Multi-chatbot comparison
Ask two or three different chatbots (or the same one in fresh sessions) to do the identical task, then compare or have them rate each other's output. This is a fast way to see the range of what's possible and to spot a chatbot's blind spots.

### 5. Persona / roleplay conversations
Have the chatbot simulate two personas talking to each other (teacher & student, two historical figures, two opposing debaters) instead of answering directly. This produces livelier, more exploratory output than a flat Q&A, and is especially good for educational or exploratory topics.

### 6. Genre remix
Take one fixed idea (a proof, a fact, a lesson) and ask for it retold in a wildly different genre each time — a sonnet, a play, a recipe, a diary entry, a series of news headlines. This is a great way to explore both the chatbot's range and the user's own understanding of the material.

### 7. Iterative critique loops
After a first version, explicitly ask for critique — either from the same chatbot or a different one — then apply it and repeat. Treat the first output as a draft, not a deliverable.

### 8. Show reasoning, hide complexity (for learning contexts)
If the goal is partly educational (the user or someone else is learning to program or understand a concept), ask the chatbot to explain its plan or pseudocode in plain language *before* generating real code, and to keep that explanation available separately. This scaffolds understanding without dumbing down the actual output.

### 9. Test at the edges
Once something works, deliberately try adjacent or slightly-wrong inputs to see where it breaks. This is both a QA step and, in educational contexts, a way to deepen understanding of what the chatbot actually built.

## Output format

When applying this skill, give the user:
- A one-line pick of which 2-3 patterns fit their case and why
- A ready-to-paste prompt they can drop into their chatbot session
- One suggested next iteration step

Keep it concrete and short — the goal is to get the user typing into their chatbot quickly, not to read a lecture on creativity theory.
