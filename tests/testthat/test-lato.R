context("Lato font")

library("mockery")

test_that("import_lato returns path to folder containing TTF file", {
  m <- mock(TRUE, cycle = TRUE)
  stub(import_lato, "extrafont::loadfonts", m)
  stub(import_lato, "extrafont::font_import", m)
  path <- import_lato()
  expect_true(dir.exists(path))
  expect_true(grepl("\\.ttf$", list.files(path)))
})
