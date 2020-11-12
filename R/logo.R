#' Logo image
#'
#' Places an image on the drawing canvas. This function is not intended to be
#' used on its own, but instead should be added to a ggplot2 plot to add a logo
#' in the bottom right of the plot. Because of some implementation details, this
#' function must be the last call in a ggplot2 chain; you won't be able to add
#' additional ggplot2 elements after adding the logo.
#'
#' This function requires the `magick` package.
#'
#' @inheritParams cowplot::draw_image
#' @export
#' @examples
#' library("ggplot2")
#'
#' ggplot(mpg, aes(displ, hwy, colour = class)) +
#'   geom_point() +
#'   logo_image()
logo_image <- function(image = system.file("SageBionetworks-Logo.png", package = "sagethemes"),
                       x = 0.95,
                       y = 1,
                       hjust = 1,
                       vjust = 1,
                       halign = 1,
                       valign = 1,
                       width = 0.25) {
  img <- cowplot::ggdraw() +
    cowplot::draw_image(
      image,
      x = x,
      y = y,
      hjust = hjust,
      vjust = vjust,
      halign = halign,
      valign = valign,
      width = width
    )
  class(img) <- c("gglogo", class(img))
  img
}

#' @importFrom ggplot2 ggplot_add
#' @export
ggplot_add.gglogo <- function(object, plot, object_name) {
  cowplot::plot_grid(plot, object, nrow = 2, rel_heights = c(9, 1))
}
