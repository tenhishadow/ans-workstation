# agents.md

## Where to run
- Always from the repository root.

## Language
- Keep this file in English only.

## Tests (Arch Linux)
- Full run: `go-task test`
  - Starts the `archlinux:latest` container and runs `./.test/exec.sh`.
  - A second `go-task` run happens inside to verify idempotency.
- Linter: `go-task lint`
- Quick playbook run: `go-task`

## Important
- On Arch Linux, use `go-task` (not `task`).
- `go-task test` requires Docker (or a compatible runtime).
- After any changes, run `go-task lint` and `go-task test`.

## Arch Linux Packages File Rules
- `roles/system/vars/archlinux-packages.yml` is a special maintenance file.
- Always verify package names are still current in Arch Linux repos before finalizing changes (packages can be renamed over time).
- Keep custom fold markers intact and balanced: `# : <category> {{{` ... `# : }}}`.
- Preserve grouping and sorting conventions inside each fold category.
- Keep all Kubernetes-related packages in the dedicated `kubernetes` fold category.
