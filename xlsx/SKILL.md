---
name: xlsx
description: >
  Create, read, edit, and process Excel (.xlsx) files.
---

# XLSX

## Overview
Work with Excel (.xlsx) files — create, read, edit, process data.

## When to trigger
- Any task involving a .xlsx file
- User mentions 'Excel', 'spreadsheet', or wants data in .xlsx format

## Tooling (Python)
- Read/write: openpyxl
- Data analysis: pandas + openpyxl engine
- Charts: openpyxl.chart

## Common patterns
`python
import openpyxl

# Create
wb = openpyxl.Workbook()
ws = wb.active
ws['A1'] = 'Hello'
wb.save('output.xlsx')

# Read
wb = openpyxl.load_workbook('input.xlsx')
ws = wb.active
for row in ws.iter_rows(values_only=True):
    print(row)
`

## Rules
- Preserve existing formatting when editing
- Use named tables for structured data
- Freeze panes on header row for readability
- Validate data types before writing (avoid #VALUE! errors)
