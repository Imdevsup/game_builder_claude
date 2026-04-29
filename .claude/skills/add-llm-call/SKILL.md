---
name: add-llm-call
description: use when any new feature wants to call an LLM.
---

# add-llm-call

## what this does
wires the call through the abstraction layer with all required guards.

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
1. go through packages/shared/src/llm only
2. design the prompt template
3. add few-shot or schema constraint
4. add fallback to template
5. add cache lookup before call
6. add cost counter increment
7. add eval cases for output quality

## deliverable
an LLM call site with template, fallback, cache, cost tracking, evals.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
