#' @title Mouse Anchors Initial Dataset
#'
#' @description A dataset containing sample names and scores.
#'
#' @format A data frame with 31322 rows and 18 variables:
#' \describe{
#'   \item{unit}{Anchor Idenitifier}
#'   \item{topK}{Initial cell type assignment based on FICTURE model}
#'   \item{X}{Anchor X coordinate.}
#'   \item{Y}{Anchor Y coordinate.}
#'   \item{Count}{# of genes is observed within the anchor space}
#' }
#' @source Sourced from the original python FICTURE example and Vizgen MERFISH Mouse Liver Map.
#' @docType data
#' @keywords datasets
#' @name mouse_anchors
#' @usage data(mouse_updated_anchor)
"mouse_anchors"

#' @title Mouse Liver Gene Transcripts
#'
#' @description A dataset containing gene observations labeled with X and Y coordinates and observation counts
#'
#' @format A data frame with 2,462,371 rows and 5 variables:
#' \describe{
#'   \item{gene}{Gene name for each observation}
#'   \item{X}{Pixel X coordinate.}
#'   \item{Y}{Pixel Y coordinate.}
#'   \item{Count}{# of times gene is observed at given coordinate}
#' }
#' @source Sourced from the original python FICTURE example and Vizgen MERFISH Mouse Liver Map.
#' @docType data
#' @keywords datasets
#' @name mouse_transcripts
#' @usage data(mouse_updated_anchor)
"mouse_transcripts"

#' @title Mouse Liver Final Anchor Assignment
#'
#' @description A dataset containing final class assignment for each anchor point.
#'
#' @format A data frame with 675 rows and 15 variables:
#' \describe{
#'   \item{topK}{Final anchor cell type assignment based on FICTURE model}
#'   \item{X}{Anchor X coordinate.}
#'   \item{Y}{Anchor Y coordinate.}
#' }
#' @source Generated from the slda_decoder function.
#' @docType data
#' @keywords datasets
#' @name mouse_updated_anchor
#' @usage data(mouse_updated_anchor)
"mouse_updated_anchor"

#' @title Mouse Liver Final Pixel Assignment
#'
#' @description A dataset containing final class assignment for each pixel point.
#'
#' @format A data frame with 60170 rows and 15 variables:
#' \describe{
#'   \item{topK}{Final pixel cell type assignment based on FICTURE model}
#'   \item{X}{pixel X coordinate.}
#'   \item{Y}{pixel Y coordinate.}
#' }
#' @source Generated from the slda_decoder function.
#' @docType data
#' @keywords datasets
#' @name mouse_pixel
#' @usage data(mouse_updated_anchor)
"mouse_pixel"
