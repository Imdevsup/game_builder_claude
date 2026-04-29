---
name: prompt-injection-check
description: use when any LLM call that accepts user input.
---

# prompt-injection-check

## what this does
audits for prompt injection and adds escapes.

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
1. identify user input fields
2. wrap with delimiters and validation
3. add output validation if structure matters
4. add tests with malicious inputs

## deliverable
injection-guarded call with red-team tests.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
