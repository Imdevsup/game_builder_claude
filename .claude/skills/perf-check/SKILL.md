---
name: perf-check
description: use when before any deploy or perf concern.
---

# perf-check

## what this does
checks frame time, latency, throughput against budgets.

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
- t
- e
- s
- t
- i
- n
- g
- .
- m
- d

## steps
1. run client perf bench
2. run server load test
3. compare against budgets in docs/conventions/testing.md
4. flag regressions

## deliverable
perf report with regressions called out.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
