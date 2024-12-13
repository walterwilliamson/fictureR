% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualizer.R
\name{visualizer}
\alias{visualizer}
\title{Generates spatial plot of spatial transcriptomics data}
\usage{
visualizer(data, type = c("anchor", "pixel"))
}
\arguments{
\item{data}{A data frame containing coordinate and class assignment data}

\item{type}{Specifies whether the data is anchor or pixel level}
}
\value{
Plotted data
}
\description{
This function plots anchor or pixel level data, where each color represents a different class.
}
