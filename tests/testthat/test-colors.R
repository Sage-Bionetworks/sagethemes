context("Colors")

test_that("All colors are valid hex representations", {
  valid_hash <- vapply(
    sage_colors,
    function(x) all(grepl("^#[0-9A-F]{6}$", x)),
    FUN.VALUE = logical(1)
  )
  expect_true(all(valid_hash))
})
