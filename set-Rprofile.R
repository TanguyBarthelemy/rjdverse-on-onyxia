#!/usr/bin/env Rscript

# Configuration environment ----------------------------------------------------

lines_to_add <- c(
    '
Sys.setenv(GITHUB_PAT = Sys.getenv("GITHUB_TANGUYBARTHELEMY"))
source("https://raw.githubusercontent.com/TanguyBarthelemy/rjdverse-on-onyxia/refs/heads/main/install.R")
options(
    warnPartialMatchAttr = TRUE,
    warnPartialMatchDollar = TRUE,
    warnPartialMatchArgs = TRUE,
    showErrorCalls = TRUE
)

options(useFancyQuotes = FALSE)

sunrise <- bioRad::sunrise(date = Sys.Date(), lon = 2.3, lat = 48.8)
sunset <- bioRad::sunset(date = Sys.Date(), lon = 2.3, lat = 48.8)

setHook("rstudio.sessionInit", function(newSession) {
    if (newSession) {
        if (Sys.time() < sunrise || Sys.time() > sunset) {
            rstudioapi::applyTheme("Material")
        } else {
            rstudioapi::applyTheme("Textmate (default)")
        }
    }
}, action = "append")
    '
)

write(lines_to_add, file = file.path(Sys.getenv("HOME"), ".Rprofile"), append = TRUE)
