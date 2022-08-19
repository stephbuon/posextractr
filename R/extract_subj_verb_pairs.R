#' @export
extract_subj_verb_pairs <- function(dataframe, col) {
  posextract <- import("posextract")
  dataframe <- posextract$subj_noun_pairs$extract(dataframe, col) # change to (dataframe, ...) maybe
  dataframe[] <- lapply(dataframe, as.vector)
  return(dataframe) }

