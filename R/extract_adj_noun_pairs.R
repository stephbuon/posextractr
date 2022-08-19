#' @export
extract_adj_noun_pairs <- function(dataframe, col) {
  posextract <- import("posextract")
  dataframe <- posextract$adj_noun_pairs$extract(dataframe, col) # change to (dataframe, ...) maybe
  dataframe[] <- lapply(dataframe, as.vector)
  return(dataframe) }


