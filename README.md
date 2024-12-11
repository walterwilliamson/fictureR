
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fictureR

# fictureR: FICTURE from Si et al. 2023 in R

`fictureR` is an R implementation of the **FICTURE** method, designed to
efficiently handle high-resolution spatial transcriptomics (ST) data.
This package focuses on **variational Expectation-Maximization (EM)
steps** and attempts to perform **Latent Dirichlet Allocation (LDA)
training** for analyzing complex, segmentation-free ST datasets at
submicron resolution.

## Purpose

Spatial transcriptomics (ST) data allow for transcriptome-wide gene
expression analysis with high spatial precision, often at submicron
resolution. Traditional methods rely on cell segmentation or gridding,
which often fail in tissues with irregular and diverse cell sizes and
shapes. **FICTURE** bypasses these issues with a **segmentation-free
spatial factorization** approach that efficiently scales to large
datasets, including those with billions of spatial coordinates.

The R implementation focuses on: - Performing the **variational EM
step**, crucial for spatial factorization. - Attempting **LDA training**
to model the spatial distribution of gene expression in tissues.

The package is ideal for users working with both sequencing- and
imaging-based ST data and is compatible with large-scale,
high-resolution studies

## Installation

You can install the development version of fictureR from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("walterwilliamson/fictureR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(fictureR)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
