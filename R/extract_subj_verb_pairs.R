#' @export
extract_subj_verb_pairs <- function(hansard, col) {

  reticulate::use_python("/usr/bin/python3")

  #path <- here::here()
  #path <- paste0(path, "/posextractr/")

  #t <- reticulate::import_from_path("posextract.driver", path = path)

  t <- reticulate::import_from_path("posextract.extract_subj_verb_pairs", "~/projects/posextractr/")

  # import_from_path
  hansard <- t$driver(hansard, col)

  hansard[] <- lapply(hansard, as.vector)

  return(hansard) }

