# AGENTS.md

## Scope

- This file applies to `.circleci/`.
- CircleCI runs an Arch Linux based workflow here.

## Local Rules

- Preserve the `archlinux:multilib-devel` execution context unless explicitly
  requested otherwise.
- Preserve the dependency setup required to run `go-task`.
- Preserve the reflector setup unless CI bootstrap changes are explicitly
  requested.
- Do not change CircleCI behavior as part of `AGENTS.md` maintenance.

## Validate

- Validate YAML syntax where the current tooling allows it.
- For future behavior changes, compare against the existing `go-task` based
  bootstrap flow.

## Done Means

- CircleCI still reflects the current Arch Linux bootstrap behavior and stays
  syntax-clean.
