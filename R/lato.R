#' Import Lato font
#'
#' First registers fonts so that they can be used with the PDF, PostScript, or
#' Windows bitmap output devices, then imports Lato.
#'
#' This does not replace the need to install Lato on your system for output to
#' other graphics devices (e.g. png). You can do this by downloading the font
#' from the web and saving it to the appropriate location for your system
#' (`/Library/Fonts/` on macOS). `import_lato()` invisibly returns the path to
#' the TTF file that's included in the package, in case you prefer to copy it
#' from there to your system font library.
#'
#' @return Path to folder containing Lato TTF file (invisibly)
#' @export
#' @references
#' <http://www.latofonts.com/>
#' @examples
#' \dontrun{
#' import_lato()
#' }
import_lato <- function() {
  if (.Platform$OS.type == "windows") {
    extrafont::loadfonts("win", quiet = TRUE)
  }
  extrafont::loadfonts("pdf", quiet = TRUE)
  extrafont::loadfonts("postscript", quiet = TRUE)
  path <- system.file("fonts", package = "sagethemes")
  suppressMessages(extrafont::font_import(path, prompt = FALSE))
  return(invisible(path))
}
