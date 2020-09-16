#' Sage ggplot2 theme
#'
#' A theme that uses Lato as the base font family (if available) and increases
#' the base font size.
#'
#' @inheritParams ggplot2::theme_grey
#' @export
#' @examples
#' \dontrun{
#'
#' library("ggplot2")
#'
#' ggplot(mpg, aes(displ, hwy, colour = class)) +
#'   geom_point() +
#'   scale_color_sage_d() +
#'   theme_sage()
#' }
theme_sage <- function(base_size = 14, base_family = "Lato",
                       base_line_size = base_size / 22,
                       base_rect_size = base_size / 22) {
  if (base_family == "Lato" & !"Lato" %in% extrafont::fonts()) {
    base_family <- "" # fall back to ggplot2 default
    rlang::warn(message = "Lato font not found; falling back to ggplot2 default. Please install Lato on your system.")
  }
  ggplot2::theme_grey(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size
  )
}
