#' Discrete color scales
#'
#' These create discrete color scales using the hues in the Sage branded colors
#' list.
#'
#' @inheritDotParams ggplot2::scale_colour_brewer
#' @inheritParams ggplot2::scale_colour_brewer
#' @inheritParams sage_hue_pal
#' @export
#' @rdname scale_sage_d
#' @examples
#' library("ggplot2")
#'
#' ggplot(mpg, aes(displ, hwy, colour = class)) +
#'   geom_point() +
#'   scale_color_sage_d()
#'
#' ggplot(mpg, aes(displ, hwy, colour = class)) +
#'   geom_point() +
#'   scale_color_sage_d(level = "800")
#'
#' ggplot(mtcars, aes(factor(vs), fill = factor(cyl))) +
#'   geom_bar() +
#'   scale_fill_sage_d()
scale_colour_sage_d <- function(..., level = "500", direction = 1, aesthetics = "colour") {
  ggplot2::discrete_scale(
    aesthetics,
    "sage_d",
    sage_hue_pal(level = level, direction = direction),
    ...
  )
}

#' @rdname scale_sage_d
#' @export
scale_fill_sage_d <- function(..., level = "500", direction = 1, aesthetics = "fill") {
  ggplot2::discrete_scale(
    aesthetics,
    "sage_d",
    sage_hue_pal(level = level, direction = direction),
    ...
  )
}

#' @rdname scale_sage_d
#' @export
#' @usage NULL
scale_color_sage_d <- scale_colour_sage_d
