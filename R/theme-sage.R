#' Sage ggplot2 theme
#'
#' Right now just replaces the base font family with Lato and increases the base
#' font size.
#'
#' @importFrom ggplot2 %+replace%
#' @param ... Arguments passed to [ggplot2::theme_grey()]
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
theme_sage <- function(...) {
  ggplot2::theme_grey(...) %+replace%
    ggplot2::theme(
      text = ggplot2::element_text(family = "Lato", size = 14)
    )
}
