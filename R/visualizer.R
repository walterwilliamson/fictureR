#' Generates spatial plot of spatial transcriptomics data
#'
#' This function plots anchor or pixel level data, where each color represents a different class.
#'
#' @param data A data frame containing coordinate and class assignment data
#' @param type Specifies whether the data is anchor or pixel level
#' @return Plotted data
#' @export
#' @examples
#' visualizer(data, type = "anchor")

visualizer <- function(data, type = c("anchor", "pixel")){
  if(type == "anchor"){
    plot_data <- data.frame(
      x = data[,"x"],
      y = data[,"y"],
      label = as.factor(data[,"updated_class"]) # change it to factor
    )
    # plot the anchor before the update
    ggplot(plot_data, aes(x = x, y = y, color = label)) +
      geom_point(size = 3, alpha = 0.8) +
      scale_color_brewer(palette = "Set3") +
      theme_minimal() +
      labs(
        title = "Anchor Points",
        x = "X Coordinate",
        y = "Y Coordinate",
        color = "Label"
      ) +
      theme(
        text = element_text(size = 12),
        legend.position = "right"
      )
  }
}
