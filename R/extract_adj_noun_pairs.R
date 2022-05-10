#' @export
extract_adj_noun_pairs <- function(hansard) {

  reticulate::use_python("/usr/bin/python3")

  path <- here::here()
  path <- paste0(path, "/")

  t <- reticulate::import_from_path("posextract.driver", path = path, convert = TRUE) #"./posextractr/", convert = TRUE)

  hansard_small <- t$driver(hansard)

  return(hansard_small) }
