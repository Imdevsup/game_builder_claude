---
name: security-audit
description: use when before any deploy or security concern.
---

# security-audit

## what this does
runs the security audit checklist.

## docs to read first
- d
- o
- c
- s
- /
- p
- l
- a
- y
- b
- o
- o
- k
- s
- /
- e
- x
- p
- l
- o
- i
- t
- -
- f
- o
- u
- n
- d
- .
- m
- d

## steps
1. delegate to security-auditor
2. run static checks
3. run pentest checklist (if scheduled)
4. delegate to exploit-hunter for adversarial pass

## deliverable
audit report with severity-graded findings.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
