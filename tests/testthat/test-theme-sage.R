context("Sage theme")

test_that("theme_sage() changes font family to Lato", {
  t <- theme_sage()
  expect_equal(t$text$family, "Lato")
})

test_that("theme_sage() changes base font size to 16", {
  t <- theme_sage()
  expect_equal(t$text$size, 16)
})
