context("Continuous color/fill scales")

library("ggplot2")

test_that("scales error if option isn't in color names", {
  dat <- data.frame(x = 1:5, y = 1:5)
  expect_error({
    ggplot(dat, aes(x, y, colour = y)) +
      geom_point() +
      scale_colour_sage_c(option = "foo")
  })
  expect_error({
    ggplot(dat, aes(x, y, fill = y)) +
      geom_tile() +
      scale_fill_sage_c(option = "foo")
  })
})

# Visual tests -----------------------------------------------------------------

test_that("Color appears", {
  dat <- data.frame(x = 1:5, y = 1:5)
  p <- ggplot(dat, aes(x, y, colour = y)) +
    geom_point() +
    scale_colour_sage_c(option = "royal")
  vdiffr::expect_doppelganger("scale_colour_sage_c", p)
})

test_that("Fill appears", {
  dat <- data.frame(x = 1:5, y = 1:5)
  p <- ggplot(dat, aes(x, y, fill = y)) +
    geom_tile() +
    scale_fill_sage_c(option = "fern")
  vdiffr::expect_doppelganger("scale_fill_sage_c", p)
})
