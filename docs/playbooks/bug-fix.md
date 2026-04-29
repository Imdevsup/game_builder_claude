# Playbook: bug fix

## Steps

1. **Reproduce.** A bug is not real until it is reproducible. If you cannot reproduce, document the report in `docs/decisions/OPEN.md` and stop.
2. **Test first.** Write the failing test. Commit the failing test.
3. **Diagnose.** Find the smallest change that makes the test pass.
4. **Fix.** Apply the change. Add comments only if the fix is non-obvious.
5. **Search adjacent.** Does the same root cause exist elsewhere? Grep, fix all hits in the same PR.
6. **Record.** ADR only if the bug revealed an architecture flaw.
7. **Hand back.** Summary plus what test now fails-then-passes plus any adjacent fixes.

## Severity

- **P0:** prevents play, data loss, money loss, exposes secrets. Drop everything.
- **P1:** breaks a major feature for many players. Same-day fix.
- **P2:** annoying, has a workaround. Schedule.
- **P3:** cosmetic, edge case. Backlog.
