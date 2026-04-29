---
description: intake and fix a bug
argument-hint: <bug-description>
---

Bug: $ARGUMENTS

1. capture the bug using the capture-bug skill (severity, repro, area)
2. delegate to bug-triage agent
3. follow docs/playbooks/bug-fix.md
4. add a regression test
5. log in CHANGELOG

Do not fix without the regression test.
