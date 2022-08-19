#' Extract grammatical subject-verb pairs from textual data.
#'
#' @usage extract_subj_verb_pairs()
#'
#' @examples
#' extract_subj_verb_pairs(dataframe, col_name)
#'
#' @export
extract_subj_verb_pairs <- function(dataframe, col) {
  posextract <- import("posextract")
  dataframe <- posextract$subj_noun_pairs$extract(dataframe, col) # change to (dataframe, ...) maybe
  dataframe[] <- lapply(dataframe, as.vector)
  return(dataframe) }

