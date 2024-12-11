
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

You can install the development version of fictureR from Github with:

``` r
# install.packages("devtools")
devtools::install_github("walterwilliamson/fictureR")
```

## Example

Here we show the basic usage of the `slda_decoder` and `visualizer`
functions, using an example dataset of mouse liver gene expression from
\[Vizgen MERFISH\]:(<https://info.vizgen.com/mouse-liver-access>)

``` r
library(fictureR)
mouse_anchors <- fictureR::mouse_anchors
mouse_transcripts <- fictureR::mouse_transcripts

# Visualization of anchors before variational EM
visualizer(mouse_anchors, type = c("anchor"))
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

# Decoding input data
# mouse_output <- slda_decoder(mouse_transcripts, mouse_anchors, scale = 100)
# mouse_output <- fictureR::mouse_output
# 
# visualizer(mouse_output, type = c("anchor"))
```
