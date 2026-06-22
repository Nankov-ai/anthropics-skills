---
name: b2b-outbound-automation
description: >
  Design and implement automated B2B outbound campaigns using the 4-block architecture:
  email infrastructure, TAM + lead scoring, intent data, and multi-channel sequencers.
  TRIGGER when the user asks about outbound sales automation, lead generation workflows,
  cold outreach campaigns, prospecting pipelines, LinkedIn/email/WhatsApp sequencing,
  enriching contact lists, or building an automated meeting-booking process. Also use
  when the user wants to define an "operating system" of rules for a sales agent.
  Do NOT use for inbound marketing, content strategy, or CRM configuration unrelated to outbound.
---

# B2B Outbound Automation

Framework for automating the full outbound cycle — from infrastructure setup to personalized
multi-channel outreach — while keeping humans in control of every send.

## The 4-Block Architecture

### Block 1 — Email Infrastructure
- Create dedicated sending domains (separate from the main domain) to protect deliverability
- Run warm-up sequences on new email accounts before sending to real prospects
- Goal: ensure emails land in inbox, not spam

### Block 2 — TAM + Lead Scoring
Define your Total Addressable Market, then enrich and score it:
- **Build the list**: companies + contacts that match your ICP (Ideal Customer Profile)
- **Enrich**: collect email, LinkedIn URL, phone/WhatsApp where possible
- **Score**: rank leads by fit criteria (company size, industry, ad spend, tech stack, etc.)
- Higher score = higher priority in the sequence

### Block 3 — Intent Data
This is the differentiator. You know *who* to contact — now find *why now* and *what hook* to use.

Intent signals to look for:
| Signal | Why it matters |
|---|---|
| New in role (< 6 months) | Decision-maker with mandate to change things |
| Following competitors on LinkedIn | Aware of the problem space |
| Sharing relevant posts | Actively thinking about the topic |
| Company recently hired for related roles | Budget and initiative exist |
| Recent funding / expansion news | Growth moment, receptive to investment |

Use tools (Clay, Phantombuster, LinkedIn Sales Navigator) to detect these signals at scale,
then embed them in the copy so each message feels researched, not templated.

### Block 4 — Sequencers (Multi-Channel Flows)
Build conditional flows that adapt based on prospect behavior:

```
Day 0:  View LinkedIn profile (creates awareness — they'll see you visited)
Day 1:  Send LinkedIn connection request
  → Accepted: send welcome message
  → Not accepted: send email
    → No reply after 3 days: follow-up email
    → Still no reply: return to LinkedIn queue in 1 week
```

Key principles:
- Every message must feel different — not just name substitution, but actual signal-based content
- Respect channel fatigue: don't hit the same person on 3 channels simultaneously
- Build in cooling-off periods between touch points

## The Agent Operating System

Before any agent takes action in your outbound stack, it must read its operating system —
a structured rule document that prevents hallucinations and keeps output within guardrails.

Structure of an agent operating system:
```
1. Identity — what this agent is and what it's allowed to do
2. Data rules — only use data that was explicitly provided; never invent numbers, stats, or facts
3. Tone rules — the voice and register for this client/campaign
4. Forbidden actions — what the agent must never do (e.g., claim ROI numbers not confirmed)
5. Escalation rules — when to flag for human review instead of proceeding
```

The agent reads this document at the start of every task. This is what prevents it from
inventing figures, going off-script, or making claims the client can't back up.

## Human-in-the-Loop (Non-Negotiable)

**Rule: agents never send or launch anything without human approval.**

In practice:
- Before launching a batch, review a sample (5–10 messages) from the queue
- If the sample looks correct and within guardrails, approve the full batch
- The agent can prepare and queue — only humans pull the trigger

This isn't a limitation — it's a feature. It keeps the human accountable for the message
and prevents runaway sends if something in the pipeline breaks.

## Contact Recycling

Not every contact will respond. Build recycling logic:

- **Non-responders**: move to a cooling list (1–4 months depending on campaign aggressiveness)
- **Negative replies**: mark as disqualified; don't re-enter in this campaign
- **Positive signals without conversion**: add to a nurture track with lower frequency

The cooling period is configurable per client based on how aggressive their outreach posture is.

## Personalization at Scale

Sending 1,000 messages doesn't mean 1,000 identical messages. The copy engine should:
1. Pull intent signals for each contact (Block 3)
2. Select the relevant signal as the opening hook
3. Connect the hook to the value proposition
4. Call to action: one clear ask (usually a short meeting)

Tools like Clay + an LLM (GPT-4, Claude) can generate this variation automatically,
but a human should review representative samples before the batch goes live.

## Tooling Approach

This framework is tool-agnostic. Match the tool to the job:
- **Enrichment + intent**: Clay, Phantombuster, Apollo, LinkedIn Sales Navigator
- **Sequencing + email**: Lemlist, Instantly, Smartlead, Salesloft
- **Copy generation**: Clay AI columns, OpenAI, Claude API
- **CRM sync**: HubSpot, Salesforce (via native integrations or Zapier/Make)

Prefer tools with native integrations to avoid brittle custom code. The architecture
should survive any single tool being replaced.

## Key Metrics to Track

| Metric | What it tells you |
|---|---|
| Delivery rate | Infrastructure health |
| Open rate | Subject line + sender reputation |
| Reply rate | Message relevance + hook quality |
| Positive reply rate | ICP fit + value proposition clarity |
| Meeting booked rate | Full funnel conversion |

A 10% meeting-booked rate from contacted prospects is strong. Optimize from bottom up:
fix meetings first, then positive replies, then reply rate, then opens.
