#' Decode the spatial transcriptomics data using the anchor-based method
#'
#' This function decodes the spatial transcriptomics data using the anchor-based method.
#'
#' @param transcripts A data frame containing pixel level spatial transcriptomics data.
#' @param anchor A data frame containing initial anchor level assignments and probabilities.
#' @param scale The scale of the dimension of filtering.
#' @return Updated anchor level data after decoding.
#' @import FNN
#' @import dplyr
#' @export


slda_decoder <- function(transcripts, anchor, scale = 100){

  xmax <- max(transcripts$X)
  xmin <- min(transcripts$X)
  ymax <- max(transcripts$Y)
  ymin <- min(transcripts$Y)

  x_range <- c(xmin,xmin + scale)
  y_range <- c(ymin,ymin + scale)

  #subsetting data
  transcripts <- transcripts %>%
    filter(X >= x_range[1], X <= x_range[2], Y >= y_range[1], Y <= y_range[2])

  anchor <- anchor %>%
    filter(x >= x_range[1], x <= x_range[2], y >= y_range[1], y <= y_range[2])

  #update rownames
  rownames(transcripts) <- 1:nrow(transcripts)
  rownames(anchor) <- 1:nrow(anchor)

  # get both transcripts and anchor coord
  sample_coords <- transcripts[, 1:2]
  anchor_coords <- anchor[, 3:4]

  # get the top 5 nearest anchor for each pixel point
  knn_result <- FNN::get.knnx(anchor_coords, sample_coords, k = 5)

  # get the idx and dist for the pixel anchor pair
  neighbor_indices <- knn_result$nn.index
  neighbor_distances <- knn_result$nn.dist

  # calculating the weight matrix
  weights <- 1 / (neighbor_distances + 1e-6)
  weights <- weights / rowSums(weights)

  # get every anchor probs for each class
  anchor_probs <- anchor[, 7:18]

  # calculate the probs for each pixel
  sample_probs <- t(sapply(1:nrow(transcripts), function(i) {
    neighbor_probs <- anchor_probs[neighbor_indices[i, ], ]
    colSums(neighbor_probs * weights[i, ])
  }))

  colnames(sample_probs) <- paste0("class_prob_", 1:12)
  sample_probs <- as.data.frame(sample_probs)

  # radius of the anchor
  hex_radius <- 8

  dist_matrix <- sqrt((outer(transcripts$X, anchor$x, "-")^2) +
                        (outer(transcripts$Y, anchor$y, "-")^2))

  # Identify which transcripts fall within the hex radius of each anchor
  in_hex <- dist_matrix <= hex_radius

  # Update anchor probabilities based on surrounding transcript probabilities
  anchor_probs_updated <- as.data.frame(matrix(0, nrow = nrow(anchor), ncol = 12))

  for (i in 1:nrow(anchor)) {
    samples_in_hex <- sample_probs[in_hex[, i], ]

    if (nrow(samples_in_hex) > 0) {
      anchor_probs_updated[i, ] <- colMeans(samples_in_hex)
    } else {
      anchor_probs_updated[i, ] <- anchor_probs[i, ]
    }
  }

  # Update the anchor class labels based on the highest probability
  anchor_labels_updated <- max.col(anchor_probs_updated, ties.method = "first")

  return(data.frame(x = anchor$x, y = anchor$y, updated_class = anchor_labels_updated,
                    updated_probs = anchor_probs_updated))
}

