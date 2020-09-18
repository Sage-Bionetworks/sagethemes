## There are currently issues installing vdiffr on CI for R version 3.2. We do
## not run the visual tests on that version of R, but R CMD check will still
## fail if the suggested package isn't available. Rather than ignore that check
## completely, this more specific helper will raise an error if we're meant to
## be running vdiffr tests but vdiffr is not installed; otherwise if vdiffr is
## not available then it will skip.

if (requireNamespace("vdiffr", quietly = TRUE)) {
  expect_doppelganger <- vdiffr::expect_doppelganger
} else {
  # If vdiffr is not available and visual tests are not explicitly disabled, raise error.
  if (!identical(Sys.getenv("VDIFFR_RUN_TESTS"), "false")) {
    rlang::abort("vdiffr is not installed")
  }
  expect_doppelganger <- function(...) skip("vdiffr is not installed.")
}
