context("Hue palette")

test_that("sage_hue_pal warns and falls back to 500 if level is invalid", {
  colors_500 <- vapply(sage_colors, function(x) x[["500"]], character(1))
  expect_warning(pal <- sage_hue_pal(level = "123"))
  expect_true(pal(1) %in% colors_500)
})

test_that("sage_hue_pal returns requested number of colors", {
  expect_equal(length(sage_hue_pal()(0)), 0)
  expect_equal(length(sage_hue_pal()(1)), 1)
  expect_equal(length(sage_hue_pal()(10)), 10)
})

test_that("sage_hue_pal warns if >14 colors requested", {
  expect_warning(sage_hue_pal()(15))
})

test_that("sage_hue_pal gets colors from correct levels", {
  colors_200 <- vapply(sage_colors, function(x) x[["200"]], character(1))
  colors_800 <- vapply(sage_colors, function(x) x[["800"]], character(1))
  expect_true(sage_hue_pal(level = "200")(1) %in% colors_200)
  expect_true(sage_hue_pal(level = "800")(1) %in% colors_800)
})

test_that("direction = -1 reverses direction of palette", {
  forward <- sage_hue_pal()(4)
  reverse <- sage_hue_pal(direction = -1)(4)
  expect_equal(reverse, rev(forward))
})
