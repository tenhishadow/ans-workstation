# AGENTS.md

## Scope

- This file applies to `inventory/`.
- `inventory/hosts.yml` defines the default `this_host` target.
- `this_host` uses `ansible_connection: local`.

## Edit Here

- Keep inventory limited to targeting and connection data.
- Keep values deterministic and easy to review.
- If future `host_vars` or `group_vars` are added by request, keep them free
  of machine-local secrets and runtime state.

## Do Not

- Do not store secrets, tokens, private keys, or session data in inventory.
- Do not invent `host_vars/` or `group_vars/` unless explicitly requested.
- Do not change the default local target unless the task requires it.

## Validate

- Run `go-task lint`.
- Run `go-task list`.
- Equivalent direct check:
  `uv run ansible-playbook --list-tasks playbook_install.yml`

## Done Means

- Inventory stays deterministic, lint-clean, and continues to target local
  `this_host`.
