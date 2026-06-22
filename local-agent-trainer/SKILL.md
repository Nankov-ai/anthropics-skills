---
name: local-agent-trainer
description: >
  Interactive skill for collaboratively designing, training, and iterating on a local Ollama agent. Use when the user wants to build, refine, or test a custom Ollama model via Modelfile.
---

# Local Agent Trainer

## Overview
Collaboratively design, train, and iterate on local Ollama agents using Modelfiles.

## When to trigger
- "treinar agente", "criar modelo ollama", "agent training", "modelfile", "build support bot"

## Workflow
1. Choose base model (llama3, mistral, phi3, gemma2, etc.)
2. Write Modelfile (SYSTEM prompt, PARAMETER tuning, TEMPLATE)
3. ollama create <name> -f Modelfile
4. Test with ollama run <name>
5. Iterate on SYSTEM prompt and parameters

## Modelfile template
`
FROM llama3
PARAMETER temperature 0.7
PARAMETER top_p 0.9
SYSTEM """
<system prompt here>
"""
`

## Key parameters
| Param | Effect |
|---|---|
| temperature | Creativity (0=deterministic, 1=creative) |
| top_p | Nucleus sampling |
| num_ctx | Context window size |
