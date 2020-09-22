context("Binned color/fill scales")

library("ggplot2")
library("mockery")

set.seed(200)
df <- data.frame(
  value = seq(1, 20),
  x = runif(20),
  y = runif(20),
  z = c(rnorm(20))
)

test_that("scale_colour_sage_b creates binned color scale", {
  p <- ggplot(df, aes(x, y)) +
    geom_point(aes(colour = z))
  p1 <- p + scale_colour_sage_b(option = "apple")
  p2 <- p + scale_colour_sage_c(option = "apple")
  p1_colors <- unique(layer_data(p1)$colour)
  p2_colors <- unique(layer_data(p2)$colour)

  expect_equal(length(p1_colors), 4)
  # Plot with binned colors should have fewer unique colors than plot with
  # continuous colors
  expect_true(length(p1_colors) < length(p2_colors))
})

test_that("scale_fill_sage_b creates binned color scale", {
  p <- ggplot(df, aes(x, y)) +
    geom_tile(aes(fill = z))
  p1 <- p + scale_fill_sage_b(option = "apple")
  p2 <- p + scale_fill_sage_c(option = "apple")
  p1_colors <- unique(layer_data(p1)$fill)
  p2_colors <- unique(layer_data(p2)$fill)

  expect_equal(length(p1_colors), 4)
  # Plot with binned colors should have fewer unique colors than plot with
  # continuous colors
  expect_true(length(p1_colors) < length(p2_colors))
})

test_that("binned scale reverts to continuous on older ggplot2 versions", {
  m <- mock("3.3.1")
  stub(scale_colour_sage_b, "utils::packageVersion", m)
  set.seed(200)
  expect_warning({
    ggplot(df, aes(x, y)) +
      geom_point(aes(colour = z)) +
      scale_colour_sage_b()
  })
})

# Visual tests -----------------------------------------------------------------

test_that("Binned guide is created", {
  skip_if_not_installed("systemfonts")

  dat <- data.frame(x = 1:5, y = 1:5)
  p <- ggplot(dat, aes(x, y, fill = y)) +
    geom_tile() +
    scale_fill_sage_b(option = "fern")
  vdiffr::expect_doppelganger("scale_fill_sage_b", p)
})
