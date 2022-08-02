#' @export
extract_adj_noun_pairs <- function(hansard, col) {

  #reticulate::use_python("/usr/bin/python3")
  reticulate::use_python("~/miniconda/bin/python")

  #path <- here::here()
  #path <- paste0(path, "/posextractr/")

  #t <- reticulate::import_from_path("posextract.driver", path = path)

  t <- reticulate::import_from_path("posextract.extract_adj_noun_pairs", "~/projects/posextractr/")

  # import_from_path
  hansard <- t$driver(hansard, col)

  hansard[] <- lapply(hansard, as.vector)

  return(hansard) }


