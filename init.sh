#!/usr/bin/env bash
set -e

Rscript -e "
custom_lib <- file.path(Sys.getenv(\"HOME\"), \"renv\", \"library\")

install.packages(\"BiocManager\", repos = \"https://cloud.r-project.org\", lib = custom_lib)
BiocManager::install(\"rhdf5\", ask = FALSE, lib = custom_lib)
install.packages(c(\"bioRad\", \"rstudioapi\"), repos = \"https://cloud.r-project.org\", lib = custom_lib)
"

echo "
.libPaths(file.path(Sys.getenv(\"HOME\"), \"renv\", \"library\"))

# warn on partial matches
options(
    warnPartialMatchAttr = TRUE,
    warnPartialMatchDollar = TRUE,
    warnPartialMatchArgs = TRUE,
    showErrorCalls = TRUE
)

# Warnings are errors
# options(warn = 2L)

# Limit max element displayed
# options(max.print = 50L)

# Fancy quotes are annoying and lead to
# copy + paste bugs / frustrations
options(useFancyQuotes = FALSE)

invisible(Sys.setlocale(\"LC_ALL\", \"en_GB.UTF-8\"))

sunrise <- bioRad::sunrise(date = Sys.Date(), lon = 2.3, lat = 48.8)
sunset <- bioRad::sunset(date = Sys.Date(), lon = 2.3, lat = 48.8)

setHook(\"rstudio.sessionInit\", function(newSession) {
    if (newSession) {
        
        if (Sys.time() < sunrise || Sys.time() > sunset) {
            rstudioapi::applyTheme(\"Material\")
        } else {
            rstudioapi::applyTheme(\"Textmate (default)\")
        }
    }
}, action = \"append\")

" >> "${HOME}/.Rprofile"

curl -LsSf https://github.com/posit-dev/air/releases/latest/download/air-installer.sh | sh
source $HOME/.local/bin/env
