context("test-good_date")

test_that("single date works", {
  expect_equal(
      good_date(1981, 04, 13),
      as.Date("1981-04-13")
  )
})


test_that("multiple date works", {
    expect_equal(
        good_date(
            c(1981, 1982),
            c(4, 5),
            c(13, 14)
        ),
        as.Date(c("1981-04-13", "1982-05-14"))
    )
})


test_that("negative date works", {
    expect_equal(
        good_date(
            c(1981, -1982),
            c(4, 5),
            c(13, 14)
        ),
        c(
            as.Date("1981-04-13"),
            as.Date("1982-05-14") - lubridate::years(1982 + 1982)
        )
    )
})
