---
name: add-prompt-template
description: use when you need a reusable prompt across multiple call sites.
---

# add-prompt-template

## what this does
creates a typed, evaluated prompt template.

## docs to read first
- d
- o
- c
- s
- /
- c
- o
- n
- v
- e
- n
- t
- i
- o
- n
- s
- /
- p
- r
- o
- m
- p
- t
- -
- s
- t
- y
- l
- e
- .
- m
- d

## steps
1. place template in packages/shared/src/llm/prompts/
2. define typed inputs
3. add at least 5 eval cases
4. wire into the registry

## deliverable
a new prompt template with eval suite.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
