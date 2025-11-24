#!/usr/bin/env bash
set -euo pipefail

# Préparer Git
git config --global user.name "Tanguy BARTHELEMY"
git config --global user.email tanguy.barthelemy@insee.fr
git config --global credential.username TanguyBarthelemy
echo "GITHUB_PAT=\${GITHUB_TANGUYBARTHELEMY}" >> "${HOME}/.Renviron"
