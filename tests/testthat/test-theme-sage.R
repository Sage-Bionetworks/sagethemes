context("Sage theme")

test_that("theme_sage() changes font family to Lato", {
  t <- theme_sage()
  expect_equal(t$text$family, "Lato")
})