---
name: llm-eval-run
description: use when before shipping a prompt change.
---

# llm-eval-run

## what this does
runs the eval suite for that prompt and reports regression.

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
1. load eval cases for the prompt
2. run model against each
3. score against golden answers
4. flag regressions

## deliverable
eval report with pass/fail per case.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
