#!/usr/bin/env bash
set -e

# Installer air
curl -LsSf https://github.com/posit-dev/air/releases/latest/download/air-installer.sh | sh
source $HOME/.local/bin/env
