#' Initialize posextract
#'
#' Initialize the posextract Python virtual environment. The environment must be activated to use functions from posextract.
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
