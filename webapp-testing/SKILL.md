---
name: webapp-testing
description: >
  Test web applications — write and run unit, integration, and e2e tests using Playwright, Cypress, Jest, or Vitest.
---

# Webapp Testing

## Overview
Write and run tests for web applications.

## When to trigger
- User wants to write or run tests for a web app
- Setting up a test suite

## Test types
- Unit: Jest, Vitest - functions and components in isolation
- Integration: Testing Library - component interaction
- E2E: Playwright, Cypress - full user flows in browser

## Playwright quick start
`ash
npm init playwright@latest
npx playwright test
`

## Principles
- Test behavior, not implementation
- Use data-testid attributes for selectors
- Mock only at system boundaries
