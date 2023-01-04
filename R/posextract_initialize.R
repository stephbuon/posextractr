#' Initialize posextract
#'
#' Initialize the posextract Python virtual environment. The environment must be activated to use functions from posextract.
#'
#' @importFrom reticulate use_virtualenv
#' @export
posextract_initialize <- function() {
  use_virtualenv("r-posextract")
  print('Initialized')}
