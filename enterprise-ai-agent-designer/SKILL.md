---
name: enterprise-ai-agent-designer
description: >
  Design enterprise AI agent solutions following a structured methodology:
  challenge → solution → technical architecture → technologies → scope → benefits.
  Use when the user wants to design, plan, or document an AI agent for a specific
  industry or business use case (legal, pharma, banking, retail, insurance, HR,
  finance, logistics, etc.). Also triggers when the user asks how to build a
  chatbot, virtual assistant, or AI automation for a company department or client.
  Produces a complete agent design document with architecture, tech stack, and
  business case.
---

# Enterprise AI Agent Designer

## Overview
Design AI agent solutions for enterprise clients. Follow the pattern:
understand the business challenge → define the solution → specify the architecture
→ select technologies → define scope → articulate benefits.

## When to trigger
- User wants to design an AI agent for a specific industry or department
- User asks how to build a chatbot or virtual assistant for a client
- User wants to document an AI agent solution (proposal, technical spec, case study)
- User mentions: agente IA, virtual assistant, chat AI, AI automation, AI solution design

## Workflow

### Step 1 — Gather context
Ask (or infer from context):
- **Industry / department**: legal, pharma, banking, retail, HR, finance, etc.
- **Main challenge**: what problem does the agent solve?
- **Users**: who interacts with the agent? (employees, customers, partners)
- **Data sources**: documents, databases, APIs, ERP, CRM?
- **Constraints**: language, compliance, on-premise vs cloud, existing tech stack?

If the user provides a brief description, proceed directly and ask clarifying questions inline.

### Step 2 — Structure the solution

Use this document structure:

```
## Sobre este caso de uso
[1-2 sentences: company context and what they needed]

## Desafio
[Bullet list of the key challenges / pain points]
- Challenge 1
- Challenge 2
- Challenge 3

## Solução
[Description of the AI agent solution implemented]

## Âmbito
[What the agent covers — functional scope, integrations, channels]
- Scope item 1
- Scope item 2

## Benefícios
- **Maior capacidade**: [specific benefit]
- **Flexibilidade**: [specific benefit]
- **Melhoria nos processos**: [specific benefit]
- **Compliance/segurança**: [specific benefit]
- **Resposta rápida**: [specific benefit]

## Quote
[Optional: a testimonial-style statement from the client stakeholder persona]
```

### Step 3 — Select the agent pattern

Before defining the technical stack, identify the right architectural pattern using
the `ai-agent-patterns` skill. Key patterns for enterprise agents:

- **Sequential** — linear pipelines (intake → process → output)
- **ReAct** — agent uses tools (search, APIs, databases) with interleaved reasoning
- **Loop / Reflexion** — agent retries until quality threshold is met
- **Coordinator** — routes to specialized sub-agents by domain
- **Human-in-the-Loop** — mandatory for high-stakes or irreversible actions (send email, approve payment)
- **Plan-and-Execute** — complex projects with upfront planning phase
- **Event-Driven** — background agent triggered by webhooks, schedules, or messages

### Step 4 — Define the technical architecture

For each agent, define:

**Stack (choose appropriate components):**
| Layer | Options |
|-------|---------|
| LLM | Azure OpenAI (GPT-4o, GPT-4), Claude, Gemini |
| Orchestration | LangChain, Semantic Kernel, Azure AI Foundry, n8n |
| Frontend | Teams bot, web chat, WhatsApp, Slack, custom app |
| Backend | Azure Functions, FastAPI, Node.js |
| Data / RAG | Azure AI Search, Qdrant, pgvector, SharePoint |
| Auth | Azure AD / Entra ID, OAuth2 |
| Integrations | REST APIs, SharePoint, SAP, Salesforce, SQL |

**Architecture diagram description** (text-based):
```
[User] → [Chat Interface] → [Orchestration Layer]
                                    ↓
                         [LLM (Azure OpenAI)]
                                    ↓
                    [Knowledge Base / RAG / APIs]
                                    ↓
                         [Data Sources / Systems]
```

### Step 5 — Industry-specific patterns

Draw on these proven patterns by industry:

**Legal / Law Firms**
- RAG over legal documents, contracts, case law
- Strict confidentiality: data stays on-premise or private Azure tenant
- Features: document Q&A, clause extraction, precedent search
- Stack: Azure OpenAI + Azure AI Search + SharePoint

**Pharmaceutical**
- Administrative process automation (approvals, submissions, reporting)
- Integration with regulatory systems
- Stack: Azure OpenAI + Power Automate + SAP/ERP

**Banking / Insurance**
- Internal virtual assistant for employees (policies, procedures, HR)
- Customer-facing: product recommendations, onboarding
- Compliance-first: audit trail, explainability
- Stack: Azure OpenAI + Azure AD + internal APIs + WSO2

**Retail**
- Product/promotion content generation (leaflets, descriptions)
- Customer service agent (order status, returns, FAQs)
- Personalization: customer data + LLM
- Stack: Azure OpenAI + Leaflet Designer pattern + CRM integration

**Generic Enterprise**
- Internal knowledge base assistant (HR, IT helpdesk, policies)
- Meeting summarization and action tracking
- Stack: Azure OpenAI + Teams integration + SharePoint/Confluence

### Step 6 — Output format

Produce a complete agent design document in Portuguese (PT) or English depending
on the user's language. Include:
1. Executive summary (2-3 sentences)
2. Challenge bullets
3. Solution description
4. Architecture (text diagram + component table)
5. Scope bullets
6. Benefits bullets
7. Optional: implementation phases (MVP → Phase 2 → Phase 3)

## Key principles
- Always ground the design in a real business problem, not technology for its own sake
- Mention compliance and data privacy for regulated industries (banking, pharma, legal)
- Prefer Azure stack when the client likely uses Microsoft ecosystem
- Keep architecture pragmatic — start with MVP, suggest evolution path
- Never invent client names or people
