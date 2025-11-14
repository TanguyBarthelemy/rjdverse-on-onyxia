git config --global user.name "Tanguy BARTHELEMY"
git config --global user.email tanguy.barthelemy@insee.fr
git config --global credential.username TanguyBarthelemy

export GITHUB_PAT="${GITHUB_TANGUYBARTHELEMY}"

git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3toolkit.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjdemetra.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3bench.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3providers.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3revisions.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3nowcasting.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3x13.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3workspace.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3tramoseats.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3sts.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3filters.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3highfreq.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3stl.git
git clone https://TanguyBarthelemy:${GITHUB_TANGUYBARTHELEMY}@github.com/TanguyBarthelemy/rjd3x11plus.git

curl -o "${HOME}/config.R" 'https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/refs/heads/main/set-Rprofile.R'
curl -o "${HOME}/install.R" 'https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/refs/heads/main/install.R'
#Rscript "${HOME}/install.R"
#Rscript "${HOME}/config.R"
