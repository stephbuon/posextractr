#' Triples
#'
#' Extract triples that grammatically agree with one-another from a text column in a data frame.
#'
#' @usage extract_triples()
#'
#' @examples
#' extract_triples(dataframe$col_name)
#'
#' @export
extract_triples <- function(vect, combine_adj=F, lemmatize=F, add_aux=F) {
  posextract <- import("posextract")
  dataframe <- posextract$grammatical_triples$extract(vect, combine_adj, lemmatize, add_aux=F, verbose=F, want_dataframe=T)
  dataframe <- na_if(dataframe, "") # empty strings to NA values
  return(dataframe) }
