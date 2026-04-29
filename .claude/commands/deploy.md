---
description: deploy to production
argument-hint: [client|server|both]
---

Deploy: $ARGUMENTS (default: both)

Pre-flight:
1. main branch, tests green
2. smoke-test pass
3. CHANGELOG up to date
4. any migration is forward-compatible

Then run the appropriate deploy skill (deploy-client or deploy-server).
