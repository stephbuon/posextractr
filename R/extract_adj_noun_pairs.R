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
extract_adj_noun_pairs <- function(vect) {
  posextract <- import("posextract")
  dataframe <- posextract$adj_noun_pairs$extract(vect)
  return(dataframe) }
