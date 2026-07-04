---
name: notebooklm
description: >
  Work with Google NotebookLM: set up notebooks, write prompts, build
  "supercérebros" (virtual expert consultants from YouTube channels and books),
  generate podcasts, study guides, timelines, and infographics from your sources.
  Use when the user asks about NotebookLM, wants to learn from a set of documents
  without hallucination, needs closed-context AI (RAG over personal files),
  wants to create a virtual consultant from an expert's content, asks about the
  YouTube to NotebookLM extension, or wants to extract structured outputs
  (podcast, timeline, infographic, quiz) from their own knowledge base.
---

# NotebookLM

## Core concept

NotebookLM reasons **exclusively** over sources you upload — it cannot invent
information it has not seen. This makes it the opposite of a general chatbot:
less breadth, far more reliability and traceability.

**Closed context = no hallucination on your documents.**
Every answer cites the exact source and paragraph.

---

## Workflow: 5 steps for any notebook

1. **Define one objective per notebook** — one theme only (e.g. "Marketing Strategy",
   "Portuguese Legislation", "Client X Competitive Analysis"). Never mix topics.

2. **Load quality sources** — the output quality equals the input quality.
   Supported: PDFs, Google Docs, YouTube videos, audio files, web pages, text.
   Up to 10 source types per notebook.

3. **Start with broad questions, go deep progressively** — begin with
   "Summarize the key ideas" before asking specific questions.

4. **Demand traceability** — NotebookLM always shows the exact source and
   paragraph. Use this for academic work, legal analysis, or rigorous research.

5. **Convert to action** — don't just read summaries.
   Ask: "Based on what you read, give me a 3-step action plan for [goal]."

---

## Advanced outputs

### Audio Overview (Podcast)
Generates a ~10-minute conversation between two virtual hosts debating your sources.

**Best use:** Prepare for a meeting by loading the client's documents + generating
the podcast. Listen while commuting. Arrive with context already absorbed.

```
Prompt: "Generate an Audio Overview of this notebook. The hosts should debate
the main tensions and open questions in the material."
```

### Study Guide
Organizes the material, suggests the best learning order, and generates quizzes.

```
Prompt: "Create a complete study guide for this notebook. Include:
1. Key concepts in order of importance
2. Suggested reading sequence
3. 10 quiz questions with answers
4. Common misconceptions to avoid"
```

### Timeline
Extracts temporal information from multiple documents and builds a chronological view.

**Best use:** Legal case history, market evolution, project retrospective.

```
Prompt: "Extract all dates and events from these documents and build a
chronological timeline. Flag any gaps or contradictions between sources."
```

### Infographic
Structures information visually — step-by-step processes, comparisons, hierarchies.

```
Prompt: "Create a visual infographic explaining [topic] from these sources.
Use a clear structure: problem → causes → solutions → outcomes."
```

---

## "Supercérebro" pattern

Build a virtual consultant trained on a specific expert's entire body of work.

### How to build one

1. **Choose the expert and domain** (e.g. business scaling, leadership, nutrition)
2. **Load their content** using the YouTube to NotebookLM extension:
   - Go to the expert's YouTube channel
   - Click the extension button → sends entire channel to your notebook
   - Add their books/PDFs if available
3. **Ask as if consulting them directly:**
   ```
   "Based on the philosophy and frameworks in this notebook, what would you
   recommend I do about [specific business challenge]?"
   ```

The consultant answers using only that expert's documented thinking — no mixing
with other sources or general knowledge.

### Good supercérebro candidates
| Domain | Type of content to load |
|---|---|
| Business scaling | YouTube channel + books |
| Leadership | TED talks + books |
| Marketing | Course PDFs + blog posts |
| Legal/regulatory | Legislation PDFs + case law |
| Your own methodology | Your documents + past work |

---

## YouTube to NotebookLM extension

Chrome/Firefox extension that imports YouTube videos, playlists, or entire channels
into a NotebookLM notebook with one click.

**Install:** Search "YouTube to NotebookLM" in Chrome Web Store (400K+ users).

**Use:** Go to any YouTube channel or video → click the extension button →
select destination notebook → all transcripts are imported automatically.

Eliminates manual transcription. One click = entire channel as your knowledge base.

---

## Prompt templates for NotebookLM

### General analysis
```
Analyze the sources in this notebook and give me:
1. The 3 most important ideas
2. The key tensions or contradictions between sources
3. What is missing that I should add
4. 3 action items based on this knowledge
```

### Competitive intelligence
```
Based on these documents about [market/company], give me:
1. Key strengths and weaknesses
2. Strategic patterns I should be aware of
3. Opportunities they are not exploiting
4. How I should position against them
Cite your sources for each point.
```

### Professional preparation
```
I have a meeting with [type of person] about [topic] in 2 hours.
Based on the documents in this notebook:
1. What are the 3 things they most care about?
2. What objections should I prepare for?
3. What questions should I ask?
4. What is my strongest argument?
```

### Learning accelerator
```
I want to learn [topic] from these sources in the shortest time possible.
Give me:
1. The minimum viable knowledge (what I must know first)
2. The 20% of concepts that explain 80% of the domain
3. The most common beginner mistakes
4. A 1-week learning plan
```

---

## When NOT to use NotebookLM

| Situation | Better tool |
|---|---|
| General knowledge questions | Claude / ChatGPT |
| Real-time information (news, prices) | Perplexity / web search |
| Creating new content from scratch | Claude / ChatGPT |
| You have no sources to load | Any general LLM |

NotebookLM is a precision instrument, not a general assistant.
Use it when you have sources and need reliable, traceable answers from them.
