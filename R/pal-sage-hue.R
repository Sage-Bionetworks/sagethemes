#' Sage hue palette (discrete)
#'
#' @param level Color intensity. One of "200", "300", "400", "500", "600",
#'   "700", "800".
#' @param direction If -1, reverses the default order of the palette
#' @return A function that gives the hex colors for the requested number of
#'   values
#' @export
#' @examples
#' sage_hue_pal()(5)
#' sage_hue_pal(direction = -1)(5)
#' sage_hue_pal(level = "800")(5)
sage_hue_pal <- function(level = "500", direction = 1) {
  if (!level %in% as.character(seq(200, 800, by = 100))) {
    warning(
      paste(
        "Valid levels are ",
        paste(as.character(seq(200, 800, by = 100)), collapse = ", "),
        ". Defaulting to '500'."
      ),
      call. = FALSE
    )
    level <- "500"
  }

  force(direction)

  function(n) {
    if (n > 14) {
      warning(
        "More than 14 colors were requested, but palette only contains 14.",
        call. = FALSE
      )
    }
    pal <- vapply(
      sage_colors,
      function(x) x[[level]],
      FUN.VALUE = character(1)
    )

    ## Hard-code ordering of hues for now -- may want to make this configurable
    ## in the future
    ordered_hues <- c(
      "royal",
      "butterscotch",
      "turquoise",
      "rose",
      "fern",
      "lavender",
      "coral",
      "slate",
      "apricot",
      "powder",
      "apple",
      "blueberry",
      "stone",
      "cloud"
    )

    pal <- pal[ordered_hues]
    pal <- pal[seq_len(n)]

    if (direction == -1) {
      pal <- rev(pal)
    }

    unname(pal)
  }
}
