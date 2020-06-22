#' Sage ggplot2 theme
#'
#' Right now just replaces the base font family with Lato and increases the base
#' font size.
#'
#' @inheritParams ggplot2::theme_grey
#' @export
#' @examples
#' \dontrun{
#'
#' library("ggplot2")
#'
#' # Requires Lato font to be installed
#' ggplot(mpg, aes(displ, hwy, colour = class)) +
#'   geom_point() +
#'   scale_color_sage_d() +
#'   theme_sage()
#' }
theme_sage <- function(base_size = 14, base_family = "Lato",
                       base_line_size = base_size / 22,
                       base_rect_size = base_size / 22) {
  ggplot2::theme_grey(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  )
}
