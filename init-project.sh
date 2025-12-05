#!/bin/sh

# This init script is a variation of open-rproj, which clones
# a Git repository that contains a RStudio project (*.Rproj)
# and opens it in RStudio at startup.
# In addition, it takes as parameter the name of the git account and the git repository.

# Expected parameters :
#  - Name of the github account
#  - Name of the github repository

# Fetch the parameter
GIT_ACCOUNT=$1
GIT_REPO=$2

init_dir="/home/onyxia/.cache/init"
mkdir -p "${init_dir}"
chown -R onyxia:users "${init_dir}"

echo "PROJ_DIR=\"/home/onyxia/work/${GIT_REPO}\"" >> "/home/onyxia/.Renviron"
chown onyxia:users "/home/onyxia/.Renviron"

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

cd "/home/onyxia/work"
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/${GIT_ACCOUNT}/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/
echo "setup git proj ok"
