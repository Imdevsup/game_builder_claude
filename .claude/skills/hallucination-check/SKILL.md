---
name: hallucination-check
description: use when any LLM output that asserts canon.
---

# hallucination-check

## what this does
audits for hallucination risk and adds guards.

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

## steps
1. list facts the prompt can assert
2. decide which need ground truth in context
3. add retrieval or hardcode for high-risk facts
4. add post-validation if structure matters

## deliverable
guard plan and prompt updates.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
