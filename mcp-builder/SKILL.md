---
name: mcp-builder
description: >
  Build Model Context Protocol (MCP) servers and tools. Use when the user wants to create custom MCP integrations, tools, or resources.
---

# MCP Builder

## Overview
Build Model Context Protocol (MCP) servers that expose tools, resources, and prompts to Claude.

## When to trigger
- User wants to create a custom MCP server or tool
- Integrating an external API or service via MCP

## MCP primitives
| Primitive | Purpose |
|---|---|
| Tools | Functions Claude can call |
| Resources | Data sources Claude can read |
| Prompts | Reusable prompt templates |

## Stack options
- Python: mcp package (pip install mcp)
- TypeScript: @modelcontextprotocol/sdk

## Minimal Python server
`python
from mcp.server import Server
from mcp.server.stdio import stdio_server

app = Server("my-server")

@app.tool()
async def my_tool(param: str) -> str:
    return f"Result: {param}"

async def main():
    async with stdio_server() as (r, w):
        await app.run(r, w, app.create_initialization_options())
`

## Registration
Add to .claude/settings.json under mcpServers.
