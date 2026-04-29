---
description: close the current phase
argument-hint: 
---

Run the ship-phase skill.

Steps:
1. verify all current phase exit criteria are met
2. run smoke-test, perf-check, security-audit
3. write any pending ADRs
4. update docs/decisions/CHANGELOG.md
5. transition to next phase in docs/decisions/CURRENT_PHASE.md

If any criterion is unmet, stop and report.
