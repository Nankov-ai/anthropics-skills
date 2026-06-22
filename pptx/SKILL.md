---
name: pptx
description: >
  Use any time a .pptx file is involved — creating slide decks, reading/extracting content, editing presentations, working with templates, layouts, speaker notes.
---

# PPTX

## Overview
Work with PowerPoint (.pptx) files — create, read, edit, extract, convert.

## When to trigger
- Any mention of 'deck', 'slides', 'presentation', or a .pptx filename
- Creating pitch decks, reading slide content, or editing existing presentations

## Tooling
Use `python-pptx` for all .pptx operations.

## Workflow
1. Clarify: create new or edit existing?
2. If creating: outline slides first, get approval, then build
3. If reading: extract text slide by slide
4. Deliver file path on completion

## Common pattern
`python
from pptx import Presentation
from pptx.util import Inches, Pt

prs = Presentation()
slide = prs.slides.add_slide(prs.slide_layouts[1])
slide.shapes.title.text = "Title"
prs.save("output.pptx")
`
"@
  }
  "prompt-builder" = @{
    name = "prompt-builder"
    desc = "Build, structure, and optimize prompts for LLMs. Use when the user wants to craft, improve, or debug a prompt."
    title = "Prompt Builder"
    body = @"
## Overview
Craft, improve, and debug prompts for any LLM.

## When to trigger
- User wants to write, improve, or test a prompt
- Debugging why a prompt is not working as expected

## Prompt anatomy
1. Role - who the model is
2. Context - what situation it is in
3. Task - what to do
4. Format - how to respond
5. Constraints - what to avoid

## Techniques
- Few-shot examples: for complex output formats
- Chain of thought: for reasoning tasks
- XML tags: for structured input separation
- Temperature 0: for deterministic / factual tasks
