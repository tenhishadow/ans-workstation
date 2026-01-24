# agents.md

## Where to run
- Always from the repository root.

## Tests (Arch Linux)
- Full run: `go-task test`
  - Starts the `archlinux:latest` container and runs `./.test/exec.sh`.
  - A second `go-task` run happens inside to verify idempotency.
- Linter: `go-task lint`
- Quick playbook run: `go-task`

## Important
- On Arch Linux, use `go-task` (not `task`).
- `go-task test` requires Docker (or a compatible runtime).
- After any changes, обязательно run `go-task lint` and `go-task test`.
