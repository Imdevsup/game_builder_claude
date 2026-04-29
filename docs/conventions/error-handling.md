# Error handling

## Result types over exceptions

Domain layer: prefer a `Result<T, E>` type over throwing. Throwing is for unexpected/programmer errors.

```ts
type Result<T, E = AppError> =
  | { ok: true; value: T }
  | { ok: false; error: E };
```

## AppError taxonomy

```
AppError
  kind: "validation" | "auth" | "not_found" | "conflict" | "rate_limited" |
        "llm_failure" | "internal"
  message: string
  context: Record<string, unknown>
```

## Logging

- Always log with the request id and player id when available.
- `warn` for recoverable. `error` for unrecoverable but contained. `fatal` for process-ending.

## Client UX on errors

- Validation: inline next to the offending field.
- Auth: redirect to login.
- Not found / conflict: a toast with a friendly message.
- LLM failure: fallback content silently used. No user-visible error.
- Rate limited: a clear message with how long to wait.
