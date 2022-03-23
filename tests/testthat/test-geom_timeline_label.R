context("test-geom_timeline_label")

gg_output <- noaa %>%
    eq_clean_data() %>%
    dplyr::filter(country == "GREECE", lubridate::year(date) >= 2000) %>%
    ggplot2::ggplot(ggplot2::aes(
        x = date,
        y = country,
        size   = eq_primary,
        colour = log(total_deaths),
        label  = location_name
    )) +
    geom_timeline() +
    geom_timeline_label()


test_that("correct object in output", {
  expect_is(gg_output, "gg")
})
