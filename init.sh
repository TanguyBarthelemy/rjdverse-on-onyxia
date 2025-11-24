#!/usr/bin/env bash
set -euo pipefail

init_dir="/home/onyxia/work/init"
mkdir -p "${init_dir}"
chown -R onyxia:users "${init_dir}"

cd ${init_dir}
echo "v1.11"

curl -fsSL "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-git-TanguyBarthelemy.sh"
curl -fsSL "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-rstudio-prefs.sh"
curl -fsSL "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-locales.sh"
curl -fsSL "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-rprofile.sh"
curl -fsSL "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-air.sh"
curl -fsSL "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-firacode.sh"
