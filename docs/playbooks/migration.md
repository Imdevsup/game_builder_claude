# Playbook: migration

Changing the database schema or migrating data.

## Steps

1. **Plan.** Write the migration SQL. Write the rollback SQL. Both go in `apps/server/src/db/migrations/`.
2. **Backwards compatible first.** Add new columns nullable. Deploy the schema change. Deploy code that writes both old and new. Backfill. Deploy code that reads new only. Drop old in a later migration.
3. **Test on a fresh database.** `pnpm db:reset && pnpm db:migrate` must succeed.
4. **Test against a snapshot of prod.** If feasible, restore a snapshot to a staging DB, apply migration.
5. **Apply.** During deploy. Monitor for errors.
6. **Record.** ADR for any schema change.

## Anti-patterns

- Editing an applied migration. NEVER. Add a new migration to fix.
- Destructive changes without a backwards-compatible step.
- Skipping the rollback.
