context("Discrete color/fill scales")

library("ggplot2")

test_that("Sage colors are used in plot", {
  dat <- data.frame(x = factor(1:5), y = 1:5)
  colors <- vapply(sage_colors, function(x) x[["500"]], character(1))
  p <- ggplot(dat, aes(x = x, y = y, colour = x)) +
    geom_point() +
    scale_colour_sage_d()
  expect_equal(
    layer_data(p)$colour,
    unname(colors[c("royal", "butterscotch", "turquoise", "rose", "fern")])
  )
})

# Visual tests -----------------------------------------------------------------

test_that("Discrete fill appears", {
  skip_if_not_installed("systemfonts")

  dat <- data.frame(x = factor(1:5), y = 1:5)
  p <- ggplot(dat, aes(x, y, fill = x)) +
    geom_tile() +
    scale_fill_sage_d()
  vdiffr::expect_doppelganger("scale_fill_sage_d", p)
})
