---
description: spin up the dev environment
argument-hint: 
---

Start the local dev environment.

1. verify .env exists (copy from .env.example if not)
2. pnpm install
3. start db (supabase start) and migrate (drizzle-kit migrate)
4. pnpm dev (runs all apps in parallel)
5. report each service's status and any errors
