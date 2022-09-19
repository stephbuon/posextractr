#' Install posextract
#'
#' Prompts the user to install posextractr and dependencies.
#'
#' @usage posextract_install()
#'
#' @examples
#' posextract_install()
#'
#' @export
posextract_install <- function() {

  if(dir.exists(paste0(virtualenv_root(), '/r-posextract'))) {
    print("posextract has already been installed. Reinstall?")
    print("Press 1 to reinstall.")
    print("Press 2 to skip.")
    input <- readline(prompt="Select Option: ")

    if(input == 1) {
      print("Installing posextract...")
      virtualenv_remove("r-posextract")
      virtualenv_create("r-posextract", install_python())
      py_install(c("pandas", "spacy", "posextract")) # not work in function
      system(command = "python3 -m spacy download en_core_web_sm") # same -- do I need python or python 3
      }

    else if(input == 2) {
      print("Skipping Install.") }

    else {
      print("Not a valid option. Exiting.") } }

  else {
    print("Installing posextract...")
    virtualenv_create("r-posextract", install_python())
    py_install(c("pandas", "spacy", "posextract"))
    system(command = "python -m spacy download en_core_web_sm") } }

