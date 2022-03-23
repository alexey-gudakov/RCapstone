#' Creates a fine labels for earthquakes map
#'
#' \code{eq_create_label} creates labels for the eqrthquakes map
#' (\code{\link[leaflet]{leaflet}}) created by \code{\link{eq_map}}.
#'
#' It shows (and needs) information about:
#'   - cleaned location (if present) as provided by
#'     \code{\link{eq_location_clean}}.
#'   - magnitude
#'   - total number of death
#'
#' @param .df (data.frame) earthquake data (NOAA)
#'
#' @importFrom stringr str_c str_replace_na
#' @return (chr) the labels
#' @export
#'
#' @examples
#' \dontrun{
#'     library(dplyr)
#'     library(lubridate)
#'     library(devrcap)
#'
#'     library(lubridate)
#'         data(noaa)
#'
#'     noaa %>%
#'         eq_clean_data() %>%
#'         eq_create_label()
#'
#'     noaa %>%
#'         eq_clean_data() %>%
#'         filter(
#'             country %in% c("ITALY", "GREECE", "PORTUGAL"),
#'             year(date) >= 1900
#'         ) %>%
#'         dplyr::mutate(popup_text = eq_create_label(.)) %>%
#'         eq_map("popup_text")
#'
#'
#'     noaa %>%
#'         eq_clean_data %>%
#'         dplyr::filter(country == "MEXICO", year(date) >= 2000) %>%
#'         dplyr::mutate(popup_text = eq_create_label(.)) %>%
#'         eq_map("popup_text")
#' }
eq_create_label <- function(.df) {

    location  <- stringr::str_c(
        "<strong>Location:</strong>", .df[["location_name"]]
    ) %>% stringr::str_replace_na("")

    magnitude <- stringr::str_c(
        "<br><strong>Magnitude:</strong>", .df[["eq_primary"]]
    ) %>% stringr::str_replace_na("")


    deaths <- stringr::str_c(
        "<br><strong>Total deaths:</strong>", .df[["total_deaths"]]
    ) %>% stringr::str_replace_na("")

    stringr::str_c(location, magnitude, deaths)
}
