#' Extract grammatical triples from a text column in a data frame.
#'
#' @usage extract_triples()
#'
#' @examples
#' extract_triples(dataframe, col_name)
#'
#' @export
extract_triples <- function(dataframe, col) {
  posextract <- import("posextract")
  dataframe <- posextract$extract_triples$extract(dataframe, col) # change to (dataframe, ...) maybe
  dataframe[] <- lapply(dataframe, as.vector)
  return(dataframe) }
