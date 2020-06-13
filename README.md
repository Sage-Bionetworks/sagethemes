
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sagethemes

<!-- badges: start -->

[![R build
status](https://github.com/Sage-Bionetworks/sagethemes/workflows/R-CMD-check/badge.svg)](https://github.com/Sage-Bionetworks/sagethemes/actions)
<!-- badges: end -->

The sagethemes package provides plot color palettes and themes that use
the Sage Bionetworks branded colors.

## Installation

``` r
remotes::install_github("Sage-Bionetworks/sagethemes")
```

## Colors

Colors were developed by the Sage design team and are available in the
list `sage_colors`.

``` r
library("sagethemes")
str(sage_colors, list.len = 5)
#> List of 14
#>  $ royal       : Named chr [1:7] "#D5CFE3" "#B2A5D1" "#907FBA" "#5A478F" ...
#>   ..- attr(*, "names")= chr [1:7] "200" "300" "400" "500" ...
#>  $ powder      : Named chr [1:7] "#E1F4F5" "#C5EDF0" "#A6DDE0" "#7EC8CC" ...
#>   ..- attr(*, "names")= chr [1:7] "200" "300" "400" "500" ...
#>  $ coral       : Named chr [1:7] "#F7E2DF" "#FFC5BD" "#FCA79A" "#F47E6C" ...
#>   ..- attr(*, "names")= chr [1:7] "200" "300" "400" "500" ...
#>  $ blueberry   : Named chr [1:7] "#BCE0F7" "#94C9EB" "#77AFD4" "#5B95BA" ...
#>   ..- attr(*, "names")= chr [1:7] "200" "300" "400" "500" ...
#>  $ rose        : Named chr [1:7] "#F7C6DD" "#F7A6CC" "#F683B9" "#E566A1" ...
#>   ..- attr(*, "names")= chr [1:7] "200" "300" "400" "500" ...
#>   [list output truncated]
```

## Usage

sagethemes provides continuous, discrete, and binned scales.

``` r
library("ggplot2")
library("sagethemes")

ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
  geom_tile() +
  scale_fill_sage_c(option = "powder")
```

<img src="man/figures/README-continuous-1.png" width="100%" />

-----

## Code of Conduct

Please note that the dccvalidator project is released with a
[Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By
contributing to this project, you agree to abide by its terms.
