---
name: llm-cost-audit
description: use when monthly or after any LLM-heavy ship.
---

# llm-cost-audit

## what this does
audits LLM costs per feature and flags drift.

## docs to read first
- d
- o
- c
- s
- /
- a
- r
- c
- h
- i
- t
- e
- c
- t
- u
- r
- e
- /
- l
- l
- m
- -
- l
- a
- y
- e
- r
- .
- m
- d
- ,
-  
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
- l
- l
- m
- -
- c
- o
- s
- t
- -
- o
- v
- e
- r
- r
- u
- n
- .
- m
- d

## steps
1. pull cost counters per feature
2. compute cost per DAU per feature
3. compare against budget
4. flag features over budget with concrete fixes

## deliverable
cost report in docs/decisions/cost-audits/<date>.md.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
