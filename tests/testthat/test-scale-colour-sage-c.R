context("Continuous color/fill scales")

library("ggplot2")

# Visual tests -----------------------------------------------------------------

test_that("Color appears", {
  skip_if_not_installed("systemfonts")

  dat <- data.frame(x = 1:5, y = 1:5)
  p <- ggplot(dat, aes(x, y, colour = y)) +
    geom_point() +
    scale_colour_sage_c(option = "royal")
  vdiffr::expect_doppelganger("scale_colour_sage_c", p)
})

test_that("Fill appears", {
  skip_if_not_installed("systemfonts")

  dat <- data.frame(x = 1:5, y = 1:5)
  p <- ggplot(dat, aes(x, y, fill = y)) +
    geom_tile() +
    scale_fill_sage_c(option = "fern")
  vdiffr::expect_doppelganger("scale_fill_sage_c", p)
})
