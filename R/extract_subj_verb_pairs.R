#' Extract grammatical subject-verb pairs from a text column in a data frame.
#'
#' @usage extract_subj_verb_pairs()
#'
#' @examples
#' extract_subj_verb_pairs(dataframe, col_name)
#'
#' @export
extract_subj_verb_pairs <- function(dataframe, col) {
  posextract <- import("posextract")
  dataframe <- posextract$subj_verb_pairs$extract(dataframe, col) # change to (dataframe, ...) maybe
  dataframe[] <- lapply(dataframe, as.vector)
  return(dataframe) }

