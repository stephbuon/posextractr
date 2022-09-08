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
  dataframe <- posextract$grammatical_triples$extract(dataframe, combine_adj=F, lemmatize=F, add_aux=F, verbose =F, want_dataframe=T)#, col) # change to (dataframe, ...) maybe
  #dataframe[] <- lapply(dataframe, as.vector)
  return(dataframe) }

# add data frame options in Python
