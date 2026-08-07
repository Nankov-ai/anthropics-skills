---
name: security-review
description: >
  Review code for security vulnerabilities including OWASP Top 10, injection, auth issues, data exposure, and more.
  Also covers AI agent deployment security — access control, code execution sandboxing, network egress, and
  secrets management for agents with tool-calling or code-execution capabilities. Trigger for "security audit",
  "security review", "is this agent safe to deploy", "how do I secure my agent's tools", prompt injection concerns
  in an agent's tool access, or before merging auth/input-handling/API/agent-tooling code.
---

# Security Review

## Overview
Review code for security vulnerabilities and recommend fixes.

## When to trigger
- User asks for a security audit or security review
- Before merging auth, input handling, or API code
- /security-review command

## OWASP Top 10 checklist
1. Broken Access Control
2. Cryptographic Failures
3. Injection (SQL, command, XSS)
4. Insecure Design
5. Security Misconfiguration
6. Vulnerable Components
7. Authentication Failures
8. Integrity Failures
9. Logging & Monitoring Failures
10. SSRF

## Output format
For each finding:
- **Severity**: Critical / High / Medium / Low / Info
- **Location**: file:line
- **Issue**: what's wrong
- **Fix**: concrete remediation

## Rules
- No false sense of security — flag unknowns
- Always check for secrets/credentials in code
- Verify input validation at all system boundaries

---

## AI Agent Deployment Security

Use this section when reviewing an AI agent's architecture or deployment — not just its code. Applies whenever an agent has tool-calling, code-execution, or file/network access, and is distinct from the OWASP checklist above: that checklist audits code already written; this one audits **what the agent is allowed to touch**.

**Core principle:** controls must be enforced outside the model's control plane. Prompt-based defenses ("please don't do X", relying on the model to refuse) are not security controls — they are suggestions the model can be talked out of. Every control below must hold even if the model is fully compromised or manipulated.

### The 4 controls (source: NVIDIA AI Red Team)

1. **Access control to the agent itself** — strong authentication as the first line of defense; restrict to explicitly authorized users; the agent's permissions should never exceed the invoking user's own permissions (least privilege).

2. **Code execution limits** — avoid giving the agent raw command-line tools when a narrower tool would do. When execution is unavoidable, run it in a hardened sandbox (Docker, VM, or equivalent isolation) with a strict allow-list of permitted commands, not a deny-list. Block writes outside non-executable areas at the OS level. Validate and sanitize every external argument before it reaches the sandbox.

3. **Network egress controls** — default-deny, with a minimal allow-list of the specific endpoints the agent actually needs. Enforce this at every network boundary the agent touches, using environmental controls the agent itself cannot see or modify — an agent that knows the egress rule can be talked into working around it.

4. **Secrets management** — never expose persistent secrets to the agent in plaintext or via environment variables (the normal pattern for conventional apps is unsafe for agents, since the agent can read its own environment). Store secrets in a dedicated secrets manager; fetch short-lived, narrowly-scoped tokens on demand, only into the memory of the process that needs them, never into the agent's own context.

### Attack patterns to check for when auditing an agent
- **Social engineering of the agent** — framing a malicious action as "debugging" or "admin task" to get a tool invoked outside its intended use
- **Frog-boiling** — a sequence of individually-reasonable requests that together produce an unauthorized outcome; audit tool call sequences, not just single calls
- **Misdirection via legitimate workflows** — abusing a legitimate capability (e.g. package installation) for its side effects (e.g. arbitrary code execution during install)

### Anti-patterns
- Treating "LLM-as-a-judge" (a second model checking the first model's output) as a primary defense — it's a detection layer at best, not a control; a determined attacker who can fool one model can often fool the judge model too.
- Relying on the system prompt to declare what the agent "should never do" as the actual security boundary — that's the control this whole section exists to replace with something enforced outside the model.
- Giving an agent broad filesystem or shell access "to be safe/flexible" instead of the narrowest tool that accomplishes the task.

### Output format for an agent deployment audit
For each of the 4 controls, state: **Present / Partial / Missing**, plus the specific gap and concrete remediation — same discipline as the OWASP findings above, not a prose essay.

Source: [Four Ways to Deploy More Secure AI Agents](https://developer.nvidia.com/blog/four-ways-to-deploy-more-secure-ai-agents/) (NVIDIA Developer Blog), Aug 2026.
