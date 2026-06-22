---
name: security-review
description: >
  Review code for security vulnerabilities including OWASP Top 10, injection, auth issues, data exposure, and more.
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
