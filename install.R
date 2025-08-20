#!/usr/bin/env Rscript

library("utils")

install.packages("remotes", repos = c(CRAN = "https://cloud.r-project.org"))

remotes::install_github("rjdverse/rjd3toolkit")
remotes::install_github("rjdverse/rjdemetra")
remotes::install_github("rjdverse/rjd3bench")
remotes::install_github("rjdverse/rjd3providers")
remotes::install_github("rjdverse/rjd3revisions")
remotes::install_github("rjdverse/rjd3nowcasting")
remotes::install_github("rjdverse/rjd3x13")
remotes::install_github("rjdverse/rjd3workspace")
remotes::install_github("rjdverse/rjd3tramoseats")
remotes::install_github("rjdverse/rjd3sts")
remotes::install_github("rjdverse/rjd3filters")
remotes::install_github("rjdverse/rjd3highfreq")
remotes::install_github("rjdverse/rjd3stl")
remotes::install_github("rjdverse/rjd3x11plus")

install.packages("BiocManager")
BiocManager::install("rhdf5")
install.packages("bioRad")
install.packages("rstudioapi")
