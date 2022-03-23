#' ---
#' title: "Import NOAA Data"
#' author: "Corrado Lanera"
#' date: "`r Sys.Date()`"
#' output:
#'     prettydoc::html_pretty:
#'         theme: leonids
#'         highlight: github
#'         toc: true
#' bibliography: '`r here::here("data-raw", "bib", "import-bib.bib")`'
#' ---

#' ```{r setup, include = FALSE}
#' knitr::opts_chunk$set(
#'     collapse = TRUE,
#'     comment = "#>"
#' )
#' ```




#' ## Check packages
#' First of all we have to check if all the needed package are
#' installed. If not, please run
#' `install.packages("<missing-package>")`.
#'
#' The package **magrittr** (@R-magrittr) which import the pipe (`%>%`)
#' operator can be safely loaded because imported by the **devrcap**
#' package itself.
#'
#' On the other hand, packages as **here** (@R-here) which is used to
#' write paths that works both for the script and the document,
#' **readr** (@R-readr) which is used to read the downloaded raw-data
#' as suggested by the instruction, and **usethis** which is used to
#' include the data into the package by its `use_data()` function,
#' cannot be safely `library()`ed because they are not imported with the
#' package. Hence we check for the presence of them.

#+ packages
library("magrittr", quietly = TRUE)

requireNamespace("here", quietly = TRUE)
requireNamespace("readr", quietly = TRUE)
requireNamespace("usethis", quietly = TRUE)




#' ## Import data
#' Raw data were downloaded and stored in the folder
#' `<package_path>/data-raw`. It is a tab-delimited format which we
#' import into a data frame using the `readr::read_tsv()` funciton.
#' Finally, we include the imported data into the package.

#+ load-data
noaa <- here::here("data-raw", "signif.txt") %>%
    readr::read_tsv()

usethis::use_data(noaa)




#' ## Bibliography
#+ biblio
knitr::write_bib(c("magrittr", "here", "readr", "usethis"),
    file = here::here("data-raw", "bib", "import-bib.bib")
)
