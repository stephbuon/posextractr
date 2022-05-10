#' @export
extract_adj_noun_pairs <- function(hansard) {

  reticulate::use_python("/usr/bin/python3")

  t <- reticulate::import("posextractr.driver")

  hansard_small <- t$driver(hansard)

  return(hansard_small) }
