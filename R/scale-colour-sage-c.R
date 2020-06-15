#' Continuous gradient color scales
#'
#' These create a gradient of colors based on the high and low value of a given
#' hue from within the list of Sage branded colors.
#'
#' @inheritParams ggplot2::scale_colour_gradient
#' @inheritParams sage_gradient_pal
#' @param ... Options passed to [ggplot2::continuous_scale()]
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

  ggplot2::continuous_scale(
    aesthetics,
    "sage_c",
    sage_gradient_pal(option = option, low = low, high = high),
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
  ggplot2::continuous_scale(
    aesthetics,
    "sage_c",
    sage_gradient_pal(option = option, low = low, high = high),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @rdname scale_sage_c
#' @export
#' @usage NULL
scale_color_sage_c <- scale_colour_sage_c
