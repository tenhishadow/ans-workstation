#!/bin/bash
set -euxo pipefail

export UV_PROJECT_ENVIRONMENT="/tmp/${RANDOM}"
export UV_PYPY_INSTALL_MIRROR="https://nexus.tenhi.dev/repository/pypi/simple"
export ANSIBLE_FORCE_COLOR='true'

pacman --disable-sandbox -Sy --noconfirm --needed --noprogressbar reflector go-task git sudo >/dev/null

go-task -- --skip-tags pkg
# go-task

# idempotency
go-task -- --skip-tags pkg
# go-task
