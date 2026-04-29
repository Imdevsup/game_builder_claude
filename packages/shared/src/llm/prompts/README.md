# prompts

every prompt the game uses lives here. each prompt has:
- a typed input shape
- a system prompt
- a user template
- a few-shot example block (optional)
- an eval suite of at least 5 cases

prompts are imported by name from packages/shared/src/llm.

never inline a prompt in feature code. if a feature needs a one-off, create the file and reuse it.
