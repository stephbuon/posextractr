#' @export
extract_triples <- function(dataframe, col) {
  posextract <- import("posextract")
  dataframe <- posextract$triples$extract(dataframe, col) # change to (dataframe, ...) maybe
  dataframe[] <- lapply(dataframe, as.vector)
  return(dataframe) }
