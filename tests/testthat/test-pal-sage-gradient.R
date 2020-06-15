context("Gradient palette")

test_that("sage_gradient_pal errors if option isn't in color names", {
  expect_error(sage_gradient_pal(option = "foo"))
})

test_that("sage_gradient_pal defaults to 200-800", {
  pal <- sage_gradient_pal(option = "royal")
  expect_equal(pal(0), sage_colors[["royal"]][["200"]])
  expect_equal(pal(1), sage_colors[["royal"]][["800"]])
})

test_that("sage_gradient_pal can override low/high values", {
  pal <- sage_gradient_pal(
    option = "royal",
    low = sage_colors[["royal"]][["300"]],
    high = sage_colors[["royal"]][["700"]]
  )
  expect_equal(pal(0), sage_colors[["royal"]][["300"]])
  expect_equal(pal(1), sage_colors[["royal"]][["700"]])
})
