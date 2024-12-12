#' Generates spatial plot of spatial transcriptomics data
#'
#' This function plots anchor or pixel level data, where each color represents a different class.
#'
#' @param data A data frame containing coordinate and class assignment data
#' @param type Specifies whether the data is anchor or pixel level
#' @return Plotted data
#' @import ggplot2
#' @export


visualizer <- function(data, type = c("anchor", "pixel")){
  if(type == "anchor"){
    p <- ggplot(data, aes(x = x, y = y, color = as.factor(topK))) +
      geom_point(size = 3, alpha = 0.8) +
      scale_color_brewer(palette = "Set3") +
      theme_minimal() +
      labs(
        title = "Anchor Points",
        x = "X Coordinate",
        y = "Y Coordinate",
        color = "Anchor Label"
      ) +
      theme(
        text = element_text(size = 12),
        legend.position = "right"
      )
    print(p)
  }

  else if(type == "pixel"){
    p <- ggplot(data, aes(x = x, y = y, color = as.factor(topK))) +
      geom_point(size = 0.5, alpha = 0.8) +
      scale_color_brewer(palette = "Set3") +
      theme_minimal() +
      labs(
        title = "Pixel Points",
        x = "X Coordinate",
        y = "Y Coordinate",
        color = "Class"
      ) +
      theme(
        text = element_text(size = 12),
        legend.position = "right"
      )
    print(p)
  }
}
