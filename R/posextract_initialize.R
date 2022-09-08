#' Initialize the posextract virtual environment (required when using posextract)
#'
#' @usage posextract_initialize()
#'
#' @examples
#' posextract_initialize()
#'
#' @export
posextract_initialize <- function() {
  use_virtualenv("r-posextract")
  print('Initialized')}
