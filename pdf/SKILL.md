---
name: pdf
description: >
  Create, read, edit, and convert PDF files.
---

# PDF

## Overview
Work with PDF files — create, read, extract, merge, convert.

## When to trigger
- Any task involving a .pdf file
- User wants to extract text, merge PDFs, or generate a PDF

## Tooling (Python)
- Read/extract: PyPDF2, pdfplumber, pymupdf
- Create: eportlab, weasyprint (HTML→PDF), pdf2
- Merge/split: pypdf

## Workflow
1. Clarify operation (read, create, merge, extract, convert)
2. Use appropriate library
3. Deliver file path or extracted content

## Notes
- For complex layouts, prefer HTML→PDF (weasyprint)
- For form filling, use pypdf with AcroForm support
- OCR on scanned PDFs: pytesseract + pdf2image
"@
  }
  "pptx" = @{
    name = "pptx"
    desc = "Use any time a .pptx file is involved — creating slide decks, reading/extracting content, editing presentations, working with templates, layouts, speaker notes."
    title = "PPTX"
    body = @"
## Overview
Work with PowerPoint (.pptx) files — create, read, edit, extract, convert.

## When to trigger
- Any mention of 'deck', 'slides', 'presentation', or a .pptx filename
- Creating pitch decks, reading slide content, or editing existing presentations

## Tooling
Use python-pptx for all .pptx operations.

## Workflow
1. Clarify: create new or edit existing?
2. If creating: outline slides first, get approval, then build
3. If reading: extract text slide by slide
4. Deliver file path on completion

## Slide structure best practices
- 1 idea per slide
- Title + 3-5 bullet max
- Speaker notes for detail
- Consistent layout from slide master

## Common patterns
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
- Debugging why a prompt isn't working as expected

## Prompt anatomy
1. **Role** — who the model is
2. **Context** — what situation it's in
3. **Task** — what to do
4. **Format** — how to respond
5. **Constraints** — what to avoid

## Techniques
| Technique | When to use |
|---|---|
| Few-shot examples | Complex output formats |
| Chain of thought | Reasoning tasks |
| XML tags | Structured input separation |
| Temperature 0 | Deterministic / factual tasks |

## Anti-patterns
- Vague instructions ("be helpful") → be specific
- No output format → always specify
- Contradictory rules → resolve conflicts explicitly
