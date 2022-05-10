#' @export
extract_adj_noun_pairs <- function(hansard) {

  reticulate::use_python("/usr/bin/python3")

  path <- here::here()
  path <- paste0(path, "/posextractr/")

  t <- reticulate::import_from_path("posextract.driver", path = path) #"./posextractr/", convert = TRUE)


  # import_from_path
  hansard <- t$driver(hansard)

  return(hansard) }

