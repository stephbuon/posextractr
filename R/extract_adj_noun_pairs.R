#' @export
extract_adj_noun_pairs <- function(hansard) {

  use_python("/usr/bin/python3")

  t <- import("posextractr.driver")

  hansard_small <- t$driver(hansard)

  return(hansard_small)

}

#' @export
testy_2 <- function() {

  return("test")

}
