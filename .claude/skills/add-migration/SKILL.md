---
name: add-migration
description: use when any DB schema change.
---

# add-migration

## what this does
writes a forward and backward migration.

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
- p
- e
- r
- s
- i
- s
- t
- e
- n
- c
- e
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
- m
- i
- g
- r
- a
- t
- i
- o
- n
- .
- m
- d

## steps
1. delegate to migration-engineer
2. write forward migration in Drizzle
3. write rollback
4. test on a copy of prod data shape
5. schedule deploy window

## deliverable
migration files with rollback and runbook.

## house style
- plain english
- no em dashes
- short sentences
- specific over generic
- if blocked, ask, don't invent
