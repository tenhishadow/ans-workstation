#!/bin/bash
set -euxo pipefail

export UV_PROJECT_ENVIRONMENT="/tmp/${RANDOM}"
export UV_PYPY_INSTALL_MIRROR="https://nexus.tenhi.dev/repository/pypi/simple"
export ANSIBLE_FORCE_COLOR='true'

pacman --disable-sandbox -Sy --noconfirm --needed --noprogressbar reflector go-task git sudo >/dev/null

sudo reflector \
  --ipv4 \
  --protocol https \
  --completion-percent 95 \
  --score 10 \
  --latest 30 \
  --fastest 10 \
  --threads 8 \
  --connection-timeout 1 \
  --download-timeout 2 \
  --save /etc/pacman.d/mirrorlist

go-task -- --skip-tags pkg

# idempotency
go-task -- --skip-tags pkg
