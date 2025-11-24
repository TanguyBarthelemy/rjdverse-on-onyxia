#!/usr/bin/env bash
set -e

init_dir="${HOME}/.cache/init"
mkdir -p "${init_dir}"

chown -R onyxia:users "${init_dir}"

download_script() {
    local script_url="$1"
    local script_name="$2"
    
    local dest="${init_dir}/${script_name}"

    echo "Téléchargement : ${script_url}"
    curl -fsSL "${script_url}" -o "${dest}" || {
        echo "Erreur : impossible de télécharger ${script_name}"
        exit 1
    }

    chmod +x "${dest}"
    echo "${dest}"
}

git_script=$(download_script "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-git-TanguyBarthelemy.sh" "setup-git.sh")
"$git_script" --verbose

rstudio_script=$(download_script "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-rstudio-prefs.sh" "setup-rstudio-prefs.sh")
"$rstudio_script" --verbose

locales_script=$(download_script "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-locales.sh" "setup-locales.sh")
"$locales_script" --verbose

rprofile_script=$(download_script "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-rprofile.sh" "setup-rprofile.sh")
"$rprofile_script" --verbose

air_script=$(download_script "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-air.sh" "setup-air.sh")
"$air_script" --verbose

fira_script=$(download_script "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-firacode.sh" "setup-fira.sh")
"$fira_script" --verbose
