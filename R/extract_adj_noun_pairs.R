#' @export
extract_adj_noun_pairs <- function(hansard, col) {
  posextract <- reticulate::import_from_path("posextract.extract_adj_noun_pairs", "~/projects/posextractr/") # I won't need this once posextract has been submitted to pypi
  # posextract <- import("posextract")
  # parse here in R, then pass parsed object to extract_adj_noun_pairs()
  hansard <- posextract$extract_adj_noun_pairs(hansard, col) # change to (hansard, ...) maybe
  hansard[] <- lapply(hansard, as.vector)
  return(hansard) }


