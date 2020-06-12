context("Colors")

test_that("All colors start with a #", {
  hash_start <- vapply(
    sage_colors,
    function(x) all(grepl("^#", x)),
    FUN.VALUE = logical(1)
  )
  expect_true(all(hash_start))
})

test_that("All colors are 7 characters long", {
  is_7 <- vapply(
    sage_colors,
    function(x) all(nchar(x) == 7),
    FUN.VALUE = logical(1)
  )
  expect_true(all(is_7))
})

test_that("All colors are valid hex representations", {
  valid_hash <- vapply(
    sage_colors,
    function(x) all(grepl("^#[0-9A-F]{6}$", x)),
    FUN.VALUE = logical(1)
  )
  expect_true(all(valid_hash))
})
