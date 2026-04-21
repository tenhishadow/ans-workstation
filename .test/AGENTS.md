# AGENTS.md

## Scope

- This file applies to `.test/`.
- `.test/exec.sh` is the Arch Linux container smoke and idempotency script
  used by `go-task test`.
- `.test/exec-ubuntu.sh` is an alternate helper and is not the default
  `Taskfile.yml` test path unless the Taskfile changes.

## Local Rules

- Treat these scripts as fixtures and execution helpers, not as canonical role
  configuration.
- Do not treat generated temporary test environments as source configuration.
- `go-task test` requires Docker or a compatible container runtime.
- `.test/exec.sh` runs the playbook with `--skip-tags pkg` twice.
- This validates non-package idempotency, not package availability.

## Validate

- Run `go-task test` when Docker or a compatible runtime is available.

## Done Means

- The default test path still matches `Taskfile.yml` and documents the current
  smoke and idempotency behavior accurately.
