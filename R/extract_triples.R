#' Triples
#'
#' Extract triples that grammatically agree with one-another from a text column in a data frame.
#'
#' @importFrom reticulate import
#' @importFrom dplyr na_if
#' @export
extract_triples <- function(vect, combine_adj=F, lemmatize=F, add_aux=F) {
  posextract <- import("posextract")
  dataframe <- posextract$grammatical_triples$extract(vect, combine_adj, lemmatize, add_aux, verbose=F, want_dataframe=T)
  dataframe <- mutate_all(dataframe, ~na_if(., "")) # empty strings to NA values
  return(dataframe) }
