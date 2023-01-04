#' Adjective-Noun Pairs
#'
#' Extract grammatical adjective-noun pairs that grammatically agree with one-another from a text column in a data frame.
#'
#' @usage extract_adj_noun_pairs()
#'
#' @examples
#' extract_adj_noun_pairs(dataframe$col_name)
#'
#' @export
extract_adj_noun_pairs <- function(vect, lemmatize) {
  posextract <- import("posextract")
  dataframe <- posextract$adj_noun_pairs$extract(vect, lemmatize, want_dataframe = TRUE, verbose = FALSE)
  dataframe <- na_if(dataframe, "") # empty strings to NA values
  return(dataframe) }
