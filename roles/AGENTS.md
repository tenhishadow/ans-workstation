# AGENTS.md

## Scope

- This file applies to Ansible roles under `roles/`.
- `roles/system` is the current role used by `playbook_install.yml`.

## Authoring Rules

- Use FQCN modules such as `ansible.builtin.copy`.
- Prefer idempotent Ansible modules over `command` or `shell`.
- Use `command` or `shell` only when no module can express the operation.
- When `command` or `shell` is necessary, document why and keep
  `changed_when` accurate.
- Use explicit, deterministic `owner`, `group`, and `mode` on file-like tasks.
- Preserve existing mode conventions unless the requested change is about them.
- Keep defaults in `defaults/main.yml`.
- Keep OS-specific variables in `vars/`.
- Keep tasks small, named, and tagged when tags improve operability.
- Keep handlers in `handlers/main.yml` and notify them instead of restarting
  services inline.

## Do Not

- Do not broaden privileged behavior or add destructive operations without an
  explicit request.
- Do not bypass existing role structure with ad hoc files or one-off patterns.

## Validate

- Run `go-task lint`.
- For behavior changes, also run `go-task test` when Docker is available.

## Done Means

- Role changes are lint-clean, follow the existing structure, and preserve the
  current workstation bootstrap behavior.
