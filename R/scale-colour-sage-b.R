#' Binned color scales
#'
#' These create a binned gradient of colors based on the high and low value of a
#' given hue from within the list of Sage branded colors.
#'
#' @inheritParams ggplot2::scale_colour_gradient
#' @inheritParams sage_gradient_pal
#' @param ... Options passed to [ggplot2::binned_scale()]
#' @export
#' @rdname scale_sage_b
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
#'   scale_colour_sage_b(option = "apple")
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_sage_b(option = "powder")
scale_colour_sage_b <- function(..., option = "royal", low = NULL, high = NULL,
                                na.value = "grey50", guide = "colourbar",
                                aesthetics = "colour") {
  if (utils::packageVersion("ggplot2") < "3.3.2") {
    warning("Binned scales are only available in ggplot2 versions >= 3.3.2. Reverting to continuous.") # nolint
    return(
      scale_colour_sage_c(
        ...,
        option = option,
        low = low,
        high = high,
        na.value = na.value,
        guide = guide,
        aesthetics = aesthetics
      )
    )
  }
  ggplot2::binned_scale(
    aesthetics,
    "sage_b",
    sage_gradient_pal(option = option, low = low, high = high),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_sage_b
scale_fill_sage_b <- function(..., option, low = NULL, high = NULL,
                              na.value = "grey50", guide = "colourbar",
                              aesthetics = "fill") {
  if (utils::packageVersion("ggplot2") < "3.3.2") {
    warning("Binned scales are only available in ggplot2 versions >= 3.3.2. Reverting to continuous.") # nolint
    return(
      scale_fill_sage_c(
        ...,
        option = option,
        low = low,
        high = high,
        na.value = na.value,
        guide = guide,
        aesthetics = aesthetics
      )
    )
  }
  ggplot2::binned_scale(
    aesthetics,
    "sage_b",
    sage_gradient_pal(option = option, low = low, high = high),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @rdname scale_sage_b
#' @export
#' @usage NULL
scale_color_sage_b <- scale_colour_sage_b
