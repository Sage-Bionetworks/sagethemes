#' Sage gradient palette (continuous)
#'
#' @param option One of the Sage colors. See `names(sage_colors)` for a list.
#' @param low Optional starting value (if `NULL`, will default to the `"200"`
#'   value for the chosen color option)
#' @param high Optional ending value (if `NULL`, will default to the `"800"`
#'   value for the chosen color option)
#' @return A function that can be called on values between 0 and 1 to return the
#'   hex color of the gradient at that point in the range.
#' @export
#' @examples
#' sage_gradient_pal()(1)
#' sage_gradient_pal()(0.5)
#' sage_gradient_pal(
#'   option = "powder",
#'   low = sage_colors[["powder"]][["300"]],
#'   high = sage_colors[["powder"]][["700"]]
#' )(1)
sage_gradient_pal <- function(option = "royal", low = NULL, high = NULL) {
  if (!option %in% names(sage_colors)) {
    stop(
      paste(
        "`option` must be one of",
        paste(names(sage_colors), collapse = ", ")
      ),
      call. = FALSE
    )
  }
  palette <- sage_colors[[option]]
  if (is.null(low)) {
    low <- palette[["200"]]
  }
  if (is.null(high)) {
    high <- palette[["800"]]
  }
  scales::seq_gradient_pal(low, high, space = "Lab")
}
