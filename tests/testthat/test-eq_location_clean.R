context("test-eq_location_clean")

test_that("single location were cleaned", {
    single <- "SYRIA:  UGARIT"
    expect_equal(eq_location_clean(single), "Ugarit")
})

test_that("multiple locations were cleaned", {
    multiple   <- "JORDAN:  BAB-A-DARAA,AL-KARAK"
    expect_equal(eq_location_clean(multiple), "Bab-A-Daraa, Al-Karak")
})

test_that("location with parenthesis swere cleaned", {
    parentheses <- "GREECE:  THERA ISLAND (SANTORINI)"
    expect_equal(
        eq_location_clean(parentheses),
        "Thera Island (Santorini)"
    )
})

test_that("location without country name were cleaned", {
    none <- "SYRIAN COASTS"
    expect_equal(eq_location_clean(none), "Syrian Coasts")
})


test_that("location with multiple country names were cleaned", {
    multiple_countries <- "JORDAN:  SW:  TIMNA COPPER MINES"
    expect_equal(
        eq_location_clean(multiple_countries),
        "Timna Copper Mines"
    )
})




