# Playbook: incident

A server is on fire. Players are affected.

## Steps

1. **Acknowledge.** Note start time. Open an incident doc in `docs/decisions/incidents/<date>.md`.
2. **Stabilize.** Restart the affected room or server. Add a feature flag to disable the misbehaving subsystem.
3. **Communicate.** Status message to players. Be honest, brief.
4. **Diagnose.** Read logs. Reproduce in dev if possible.
5. **Fix or mitigate.** Either roll back, hotfix, or extend the feature flag mitigation.
6. **Resolve.** Note end time.
7. **Post-mortem.** Within 48 hours. Cause, timeline, what worked, what did not, action items. Action items get tickets.

## Anti-patterns

- Deploying an untested fix during the incident.
- Blaming people. Blame the system. Add a check or a guardrail.
