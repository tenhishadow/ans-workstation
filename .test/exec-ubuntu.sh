#!/bin/bash
set -euxo pipefail

export UV_PROJECT_ENVIRONMENT="/tmp/${RANDOM}"
export UV_PYPY_INSTALL_MIRROR="https://nexus.tenhi.dev/repository/pypi/simple"
export ANSIBLE_FORCE_COLOR='true'
export PATH="$PATH:$HOME/.local/bin"
# shellcheck disable=SC2155
export SHELL="$(type -P bash)"

apt update

# pacman --disable-sandbox -Sy --noconfirm --needed --noprogressbar reflector go-task git sudo >/dev/null
apt install -y sudo git curl apt-transport-https

cd /tmp/
curl -1sLf 'https://dl.cloudsmith.io/public/task/task/setup.deb.sh' | bash
apt install -y task
curl -LsSf https://astral.sh/uv/install.sh | sh
cd -

$SHELL -c 'type -P uv'
$SHELL -c 'type -P git'
$SHELL -c 'type -P sudo'

task -- --skip-tags pkg

# idempotency
task -- --skip-tags pkg
