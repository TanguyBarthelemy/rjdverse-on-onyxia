#!/bin/sh

# Installer des packages supplémentaires
Rscript -e "
install.packages(\"BiocManager\", repos = \"https://cloud.r-project.org\")
BiocManager::install(\"rhdf5\", ask = FALSE)
#install.packages(c(\"bioRad\", \"rstudioapi\"), repos = \"https://cloud.r-project.org\")
"

# Créer un .Rprofile
echo "
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

        PROJ_DIR <- Sys.getenv(\"PROJ_DIR\")
        if (nzchar(PROJ_DIR)) PROJ_DIR <- normalizePath(PROJ_DIR)

        if (nzchar(PROJ_DIR) && !identical(PROJ_DIR, getwd())) {
            message(\"Activation du projet RStudio\")
            rstudioapi::openProject(PROJ_DIR)
        }
    }
}, action = \"append\")

" >> "${HOME}/.Rprofile"
