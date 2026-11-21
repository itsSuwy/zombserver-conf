#!/usr/bin/env bash
set -euo pipefail

steamcmd \
  +force_install_dir /home/zomboid/server \
  +login anonymous \
  +app_update 380870 validate \
  +quit
