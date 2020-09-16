context("Sage theme")

test_that("theme_sage() changes font family to Lato if available", {
  m <- mock(c("Arial", "Calibri", "Lato"), cycle = TRUE)
  stub(theme_sage, "extrafont::fonts", m)
  t <- theme_sage()
  expect_equal(t$text$family, "Lato")
})

test_that("theme_sage() changes base font size to 14", {
  m <- mock(c("Arial", "Calibri", "Lato"), cycle = TRUE)
  stub(theme_sage, "extrafont::fonts", m)
  t <- theme_sage()
  expect_equal(t$text$size, 14)
})

test_that("theme_sage() uses default font if no Lato", {
  m <- mock(c("Arial", "Calibri"), cycle = TRUE)
  stub(theme_sage, "extrafont::fonts", m)
  expect_warning(theme_sage())
  t <- suppressWarnings(theme_sage())
  expect_equal(t$text$family, "")
})
