#!/bin/sh

init_dir="/home/onyxia/work/init"
mkdir -p "${init_dir}"
chown -R onyxia:users "${init_dir}"

echo "v1.8"

download_script() {
    local script_url="$1"
    local script_name="$2"

    local dest="${init_dir}/${script_name}"

    echo "Telechargement dans : ${dest}"
    curl -fsSL "${script_url}" -o "${dest}"

    # Convertir CRLF → LF
    sed -i 's/\r$//' "${dest}"

    chmod +x "${dest}"
    echo "${dest}"
}

git_script=$(download_script \
    "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-git-TanguyBarthelemy.sh" \
    "setup-git.sh")

echo "Exécution de : ${git_script}"
"${git_script}"

git_script=$(download_script "https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/main/library/setup-git-TanguyBarthelemy.sh" "setup-git.sh")
echo "$git_script"
"$git_script"

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
