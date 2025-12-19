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
chown -R onyxia:users /home/onyxia/.cache/git/credential

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
curl -fsSL -O "https://raw.githubusercontent.com/TanguyBarthelemy/onyxia-setup/main/library/setup-rjdverse-lib.sh"

chmod +x "setup-git-TanguyBarthelemy.sh"
chmod +x "setup-rstudio-prefs.sh"
chmod +x "setup-locales.sh"
chmod +x "setup-rprofile.sh"
chmod +x "setup-air.sh"
chmod +x "setup-firacode.sh"
chmod +x "setup-rjdverse-lib.sh"

"./setup-git-TanguyBarthelemy.sh"
echo "setup git ok"
"./setup-rstudio-prefs.sh"
echo "setup prefs ok"
"./setup-locales.sh"
echo "setup locales ok"
"./setup-rprofile.sh"
echo "setup rprofile ok"
"./setup-air.sh"
echo "setup air ok"
"./setup-firacode.sh"
echo "setup fira ok"
"./setup-rjdverse-lib.sh"
echo "setup lib for proto ok"

cd "/home/onyxia/work"
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/${GIT_ACCOUNT}/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/
echo "setup git proj ok"
