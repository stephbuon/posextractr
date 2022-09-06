#' Extract grammatical adjective-noun pairs from a text column in a data frame.
#'
#' @usage extract_adj_noun_pairs()
#'
#' @examples
#' extract_adj_noun_pairs(dataframe, col_name)
#'
#' @export
extract_adj_noun_pairs <- function(dataframe, col) {
  posextract <- import("posextract")
  dataframe <- posextract$adj_noun_pairs$extract(dataframe, col) # change to (dataframe, ...) maybe
  dataframe[] <- lapply(dataframe, as.vector)
  return(dataframe) }
