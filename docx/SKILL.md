---
name: docx
description: >
  Create, read, edit, and convert Word (.docx) files.
---

# DOCX

## Overview
Work with Microsoft Word (.docx) files — create, read, edit, convert.

## When to trigger
- Any task involving a .docx file (input or output)
- User mentions 'Word document', 'docx', or wants a document exported as Word

## Tooling
Use python-docx (Python) to create/edit programmatically.

## Workflow
1. Clarify content, styles, and any template to use
2. Generate the .docx file
3. Deliver the file path

## Rules
- Preserve existing styles when editing
- Use heading styles (Heading 1/2/3) for structure
- Tables: use python-docx Table API, not raw XML
