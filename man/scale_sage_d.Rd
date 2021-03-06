% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale-colour-sage-d.R
\name{scale_colour_sage_d}
\alias{scale_colour_sage_d}
\alias{scale_fill_sage_d}
\alias{scale_color_sage_d}
\title{Discrete color scales}
\usage{
scale_colour_sage_d(..., level = "500", direction = 1, aesthetics = "colour")

scale_fill_sage_d(..., level = "500", direction = 1, aesthetics = "fill")
}
\arguments{
\item{...}{Options passed to \code{\link[ggplot2:discrete_scale]{ggplot2::discrete_scale()}}}

\item{level}{Color intensity. One of "200", "300", "400", "500", "600",
"700", "800".}

\item{direction}{Sets the order of colors in the scale}

\item{aesthetics}{Character string or vector of character strings listing the
name(s) of the aesthetic(s) that this scale works with. This can be useful, for
example, to apply colour settings to the \code{colour} and \code{fill} aesthetics at the
same time, via \code{aesthetics = c("colour", "fill")}.}
}
\description{
These create discrete color scales using the hues in the Sage branded colors
list.
}
\examples{
library("ggplot2")

ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  scale_color_sage_d()

ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  scale_color_sage_d(level = "800")

ggplot(mtcars, aes(factor(vs), fill = factor(cyl))) +
  geom_bar() +
  scale_fill_sage_d()
}
