---
name: slack-gif-creator
description: >
  Create animated GIFs suitable for sharing in Slack. Use when the user wants to generate a GIF, animated image, or reaction GIF.
---

# Slack GIF Creator

## Overview
Create animated GIFs for sharing in Slack or other messaging platforms.

## When to trigger
- User wants to create a GIF, animated image, or reaction GIF
- 'make a GIF of...', 'animated sticker', 'Slack reaction'

## Tooling (Python)
- Pillow (PIL) for frame composition
- imageio for GIF export
- moviepy for video→GIF conversion

## GIF specs for Slack
- Max size: 2MB (Slack free), 8MB (Slack paid)
- Width: 300-500px recommended
- Frame rate: 10-24fps
- Colors: 256 max (GIF limitation)

## Workflow
1. Define content / animation concept
2. Generate frames programmatically
3. Export as .gif with optimized palette
4. Report file path and file size
