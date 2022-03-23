context("test-eq_create_label")

cleaned_data <- eq_clean_data(noaa)

test_that("correct class", {
    expect_is(
        eq_create_label(cleaned_data[1:10, ]),
        "character"
  )
})


test_that("correct (missing) output", {
    expect_match(
        eq_create_label(cleaned_data[1,]),
        "Location.*Magnitude"
    )
    expect_false(
        grepl("deaths", eq_create_label(cleaned_data[1,]))
    )


    expect_match(
        eq_create_label(cleaned_data[2,]),
        "Location"
    )
    expect_false(
        grepl("Magnitude", eq_create_label(cleaned_data[2,]))
    )
    expect_false(
        grepl("deaths", eq_create_label(cleaned_data[2,]))
    )


    expect_match(
        eq_create_label(cleaned_data[3,]),
        "Location.*Magnitude.*deaths"
    )

})
