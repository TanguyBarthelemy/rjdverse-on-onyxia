#!/bin/sh
set -euo pipefail

init_dir="/home/onyxia/.cache/init"
mkdir -p "${init_dir}"
chown -R onyxia:users "${init_dir}"
chown -R onyxia:users /home/onyxia/.cache/git/credential

cd ${init_dir}
echo "v1.14.1"

curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-git-TanguyBarthelemy.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-rstudio-prefs.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-locales.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-rprofile.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-air.sh"
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-firacode.sh"

chmod +x "setup-git-TanguyBarthelemy.sh"
chmod +x "setup-rstudio-prefs.sh"
chmod +x "setup-locales.sh"
chmod +x "setup-rprofile.sh"
chmod +x "setup-air.sh"
chmod +x "setup-firacode.sh"

"./setup-git-TanguyBarthelemy.sh"
"./setup-rstudio-prefs.sh"
"./setup-locales.sh"
"./setup-rprofile.sh"
"./setup-air.sh"
"./setup-firacode.sh"
