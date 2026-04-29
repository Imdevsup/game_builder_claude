---
name: llm-fallback-tree
description: use when any new LLM call site.
---

# llm-fallback-tree

## what this does
designs and implements the full fallback tree.

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
1. primary: best provider for this call
2. secondary: cheaper or different provider
3. template: pre-canned text
4. hardcode: silent fallback if all else fails
5. wire into the abstraction layer

## deliverable
a fallback tree implementation per call.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
