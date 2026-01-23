#!/bin/bash
set -euxo pipefail

export UV_PROJECT_ENVIRONMENT="/tmp/${RANDOM}"
export UV_PYPY_INSTALL_MIRROR="https://nexus.tenhi.dev/repository/pypi/simple"

pacman -Sy --noconfirm go-task git

go-task

# idempotency
go-task
