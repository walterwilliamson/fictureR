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

  x_range <- range(transcripts$X)[1] + c(0, scale)
  y_range <- range(transcripts$Y)[1] + c(0, scale)

  # Subset transcripts and anchor data based on the defined ranges
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

  # update the anchor
  anchor_probs_updated <- as.data.frame(matrix(0, nrow = nrow(anchor), ncol = 12))

  for (i in 1:nrow(anchor)) {

    anchor_x <- anchor[i, "x"]
    anchor_y <- anchor[i, "y"]

    # calculate dist
    distances <- sqrt((transcripts[, "X"] - anchor_x)^2 +
                        (transcripts[, "Y"] - anchor_y)^2)

    # get all the pixel point in the dist
    in_hex <- distances <= hex_radius
    samples_in_hex <- sample_probs[in_hex, ]

    # update the probs
    if (nrow(samples_in_hex) > 0) {
      anchor_probs_updated[i, ] <- colMeans(samples_in_hex)
    } else {
      anchor_probs_updated[i, ] <- list(anchor_probs[i, ])
    }
  }

  # update the label
  anchor_labels_updated <- max.col(anchor_probs_updated, ties.method = "first")

  # create result dataframe
  anchor_data_updated <- data.frame(
    x = anchor[, "x"],
    y = anchor[, "y"],
    topK = anchor_labels_updated,
    updated_probs = anchor_probs_updated
  )

  # get updated anchor probs for each class
  updated_anchor_probs <- anchor[, 7:18]

  # calculate the probs for each pixel with updated anchor label
  updated_sample_probs <- t(sapply(1:nrow(transcripts), function(i) {
    neighbor_probs <- anchor_probs_updated[neighbor_indices[i, ], ]
    colSums(neighbor_probs * weights[i, ])
  }))


  colnames(updated_sample_probs) <- paste0("class_prob_", 1:12)
  updated_sample_probs <- as.data.frame(updated_sample_probs)

  updated_pixel_data <- data.frame(
    x = transcripts[, "X"],
    y = transcripts[, "Y"],
    topK = as.factor(max.col(updated_sample_probs, ties.method = "first")),
    updated_probs = updated_sample_probs
  )

  return(list(anchor = anchor_data_updated, pixel = updated_pixel_data))
}

