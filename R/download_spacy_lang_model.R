#' Download en_core_web_sm
#'
#' Download the small English spaCy langauge model.
#'
#' @importFrom reticulate import
#' @export
download_spacy_lang_model <- function() {
  posextract <- import("posextract")
  posextract$download_language_model$download_en_core_web_sm() }
