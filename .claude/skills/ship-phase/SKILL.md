---
name: ship-phase
description: use when you're closing a phase.
---

# ship-phase

## what this does
verifies all phase exit criteria, captures decisions, transitions to next phase.

## docs to read first
- d
- o
- c
- s
- /
- b
- i
- b
- l
- e
- .
- m
- d
-  
- (
- r
- o
- a
- d
- m
- a
- p
- )
- ,
-  
- d
- o
- c
- s
- /
- d
- e
- c
- i
- s
- i
- o
- n
- s
- /
- C
- U
- R
- R
- E
- N
- T
- _
- P
- H
- A
- S
- E
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
- d
- e
- c
- i
- s
- i
- o
- n
- s
- /
- C
- H
- A
- N
- G
- E
- L
- O
- G
- .
- m
- d

## steps
1. verify each acceptance criterion
2. run smoke-test, perf-check, security-audit
3. write a phase-end ADR if any decisions need locking
4. update CHANGELOG.md with what shipped
5. transition CURRENT_PHASE.md to next phase

## deliverable
phase closed, next phase ready, CHANGELOG updated.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
