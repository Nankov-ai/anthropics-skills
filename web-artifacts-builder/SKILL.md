---
name: web-artifacts-builder
description: >
  Build self-contained web artifacts — interactive HTML/CSS/JS demos, visualizations, tools, or mini-apps that run in a browser.
---

# Web Artifacts Builder

## Overview
Build self-contained, interactive web artifacts that run directly in a browser.

## When to trigger
- User wants an interactive demo, visualization, calculator, or mini web tool
- Building a single-file HTML artifact

## Output format
Single HTML file with embedded CSS and JS (no external dependencies unless CDN).

## Preferred CDNs (if needed)
- Charts: Chart.js, D3.js
- UI: Alpine.js, Tailwind (CDN)
- Math: MathJax, KaTeX

## Quality checklist
- [ ] Works offline (or CDN clearly noted)
- [ ] Mobile responsive
- [ ] No console errors
- [ ] Accessible (keyboard nav, contrast)
- [ ] Under 500KB total

## Template
`html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>App</title>
  <style>/* styles */</style>
</head>
<body>
  <!-- content -->
  <script>// logic</script>
</body>
</html>
`
"@
  }
  "webapp-testing" = @{
    name = "webapp-testing"
    desc = "Test web applications — write and run tests (unit, integration, e2e) for web apps using frameworks like Playwright, Cypress, Jest, or Vitest."
    title = "Webapp Testing"
    body = @"
## Overview
Write and run tests for web applications.

## When to trigger
- User wants to write or run tests for a web app
- Setting up a test suite (unit, integration, e2e)

## Test types
| Type | Tool | Use for |
|---|---|---|
| Unit | Jest, Vitest | Functions, components in isolation |
| Integration | Testing Library | Component interaction |
| E2E | Playwright, Cypress | Full user flows in browser |

## Playwright quick start
`ash
npm init playwright@latest
npx playwright test
npx playwright test --ui
`

## Test writing principles
- Test behavior, not implementation
- One assertion per test (or group by scenario)
- Use data-testid attributes for selectors
- Mock only at system boundaries (API calls, time)

## CI integration
Add 
px playwright test to CI pipeline after build step.
