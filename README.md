# ans-workstation

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/tenhishadow/ans-workstation/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/tenhishadow/ans-workstation/tree/master)

Special repository for configuring workstation with Ansible
Only Archlinux is supported


## Deps-os

```bash
pacman -Sy --noconfirm --needed go-task git
```

```bash

_INSTALL_DIR="$HOME/.ans-workstation" \
  && git clone https://github.com/tenhishadow/ans-workstation.git $_INSTALL_DIR \
  && cd $_INSTALL_DIR \
  && go-task

```
