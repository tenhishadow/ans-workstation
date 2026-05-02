# AGENTS.md

## Purpose

- This repository bootstraps an Arch Linux workstation with Ansible.
- Ansible is the main provisioning mechanism in this repo.
- Only Arch Linux is supported by the current automation.
- Keep changes boring, explicit, deterministic, and maintainable.
- Preserve the existing workstation bootstrap workflow.

## Main Entry Points

- Work from the repository root unless a nearer `AGENTS.md` says otherwise.
- `Taskfile.yml` is the main task runner. Use `go-task`.
- `playbook_install.yml` is the main workstation playbook.
- `requirements.yml` installs Ansible Galaxy requirements.
- `inventory/hosts.yml` targets local `this_host`.
- `roles/system` is the current provisioning role.
- `uv` provides the Python and Ansible environment used by the tasks.

## Default Bootstrap Flow

- Keep the default `go-task` flow intact.
- `go-task` installs project dependencies and runs the playbook.
- `playbook_install.yml` applies the `system` role first.
- The playbook then checks whether `dotfiles_path` already exists.
- When the dotfiles repository is missing, it clones
  `tenhishadow/dotfiles`.
- After cloning, the playbook runs `go-task` inside the dotfiles repo.
- Do not change that dotfiles bootstrap behavior unless explicitly requested.
- Do not change the default installation flow for instruction-only work.

## Global Hard Rules

- This repo intentionally performs privileged system configuration.
- Preserve the current `become: true` behavior where the repo already needs it.
- Do not broaden privilege scope or add destructive tasks without an explicit
  request.
- Do not add new roles, package changes, browser policies, or workstation
  runtime changes as part of instruction maintenance.
- Do not weaken existing CI checks, container guards, or virtualization checks.
- Do not remove or alter the current local inventory target unless requested.
- Do not commit secrets, tokens, cookies, browser profiles, session state,
  machine-local private keys, generated configs, or runtime caches.
- Keep diffs scoped. Do not reformat unrelated YAML, TOML, or JSON files.
- Prefer vanilla `AGENTS.md` files over tool-specific instruction formats.

## Validation

- Run `go-task` for the default workstation bootstrap or playbook run.
- Run `go-task lint` for Ansible lint through the project task runner.
- Run `go-task test` for the Arch Linux container smoke and idempotency test.
- Run `go-task list` to inspect the playbook task list.
- `go-task test` requires Docker or a compatible container runtime.
- For Ansible or YAML changes, run `go-task lint` and `yamllint .` when
  `yamllint` is already available.
- For package list changes, verify package names against current Arch Linux
  repositories before finalizing.
- Package list changes are not fully covered by `go-task test` because
  `.test/exec.sh` runs the playbook with `--skip-tags pkg` twice.

## Local Rules

- The nearest `AGENTS.md` applies for work in that directory tree.
- Nested `AGENTS.md` files should add local rules, not repeat this root file.
- Check these files before editing scoped areas:
- `inventory/AGENTS.md`
- `roles/AGENTS.md`
- `roles/system/AGENTS.md`
- `roles/system/vars/AGENTS.md`
- `.github/AGENTS.md`
- `.circleci/AGENTS.md`
- `.test/AGENTS.md`

## Done Means

- Instructions stay short, accurate, and easy to maintain.
- Commands in the instructions match the real repository workflow.
- The default Arch Linux bootstrap path remains `go-task` from the repo root.
- The playbook, inventory, role behavior, package lists, CI behavior, and
  dotfiles bootstrap flow remain unchanged unless explicitly requested.
