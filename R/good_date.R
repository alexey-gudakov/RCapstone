#' Create good Date
#'
#' @param year vector of years (integer or cohercible to an integer
#'             vector)
#' @param month vector of months (integer or cohercible to an integer
#'              vector)
#' @param day vector of days (integer or cohercible to an integer
#'            vector)
#'
#' @return a vector of Date
#' @export
#'
#' @examples
#' good_date(1981, 04, 13)
#' good_date(
#'     c(1981, 1982),
#'     c(4, 5),
#'     c(13, 14)
#' )
#'
#' good_date(
#'     c(1981, -1981),
#'     c(4, 5),
#'     c(13, 14)
#' )
good_date <- function(year, month, day) {

    year   <-  as.integer(year)
    is_neg <-  year < 0
    year   <- dplyr::if_else(is_neg, -year, year)

    date <- as.Date(paste(year, month, day, sep = '-'))
    date[is_neg] <- date[is_neg] - lubridate::years(2 * year[is_neg])
    date
}
