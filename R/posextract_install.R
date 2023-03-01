#' Install posextract
#'
#' Prompts the user to install or posextractr and dependencies. Users have the option to skip.
#'
#' @importFrom reticulate virtualenv_root
#' @importFrom reticulate virtualenv_remove
#' @importFrom reticulate virtualenv_create
#' @importFrom reticulate install_python
#' @importFrom reticulate py_install
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
      py_install(c("pandas", "spacy", "posextract"), pip = TRUE)
      download_spacy_lang_model() }

    else if(input == 2) {
      print("Skipping Install.") }

    else {
      print("Not a valid option. Exiting.") } }

  else {
    print("Installing posextract...")
    virtualenv_create("r-posextract", install_python())
    py_install(c("pandas", "spacy", "posextract"), pip = TRUE)
    system(command = "python -m spacy download en_core_web_sm") } }

