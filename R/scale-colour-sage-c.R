#' Continuous gradient color scales
#'
#' These create a gradient of colors based on the high and low value of a given
#' hue from within the list of Sage branded colors.
#'
#' @inheritDotParams ggplot2::scale_colour_gradient
#' @inheritParams ggplot2::scale_colour_gradient
#' @param option One of the Sage colors. See `names(sage_colors)` for a list.
#' @param low Optional starting value (if `NULL`, will default to the `"200"`
#'   value for the chosen color option)
#' @param high Optional ending value (if `NULL`, will default to the `"800"`
#'   value for the chosen color option)
#' @export
#' @rdname scale_sage_c
#' @examples
#' library("ggplot2")
#'
#' df_na <- data.frame(
#'   value = seq(1, 20),
#'   x = runif(20),
#'   y = runif(20),
#'   z1 = c(rep(NA, 10), rnorm(10))
#' )
#'
#' ggplot(df_na, aes(x, y)) +
#'   geom_point(aes(colour = z1)) +
#'   scale_colour_sage_c(option = "apple")
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_sage_c(option = "powder")
scale_colour_sage_c <- function(..., option = "royal", low = NULL, high = NULL,
                                na.value = "grey50", guide = "colourbar",
                                aesthetics = "colour") {
  if (!option %in% names(sage_colors)) {
    stop(
      paste("`option` must be one of", paste(names(sage_colors), collapse = ", ")),
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
  ggplot2::continuous_scale(
    aesthetics,
    "sage_c",
    scales::seq_gradient_pal(low, high, space = "Lab"),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_sage_c
scale_fill_sage_c <- function(..., option, low = NULL, high = NULL,
                                na.value = "grey50", guide = "colourbar",
                                aesthetics = "fill") {
  if (!option %in% names(sage_colors)) {
    stop(
      paste("`option` must be one of", paste(names(sage_colors), collapse = ", ")),
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
  ggplot2::continuous_scale(
    aesthetics,
    "sage_c",
    scales::seq_gradient_pal(low, high, space = "Lab"),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @rdname scale_sage_c
#' @export
#' @usage NULL
scale_color_sage_c <- scale_colour_sage_c
