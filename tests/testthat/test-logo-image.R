context("Adding logo to plot")

library("ggplot2")

# Visual tests -----------------------------------------------------------------

test_that("Logo appears", {
  skip_if_not_installed("magick")

  dat <- data.frame(x = factor(1:5), y = 1:5)
  p <- ggplot(dat, aes(x = x, y = y, colour = x)) +
    geom_point() +
    logo_image()
  vdiffr::expect_doppelganger("plot-with-logo", p)
})
