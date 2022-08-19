#' @export
posextract_install <- function() {

  if(dir.exists(paste0(virtualenv_root(), '/r-posextract'))) {
    print("posextract has already been installed. Reinstall?")
    print("Press 1 for reinstall")
    print("Press 2 to pass")
    input <- readline(prompt="Select Option: ")

    if(input == 1) {
      virtualenv_create("r-posextract", install_python(), packages = c("pandas", "spacy", "posextract"))
      system(command = "python -m spacy download en_core_web_sm")
      }

    else if(input == 2) {
      print("Skipping Install") }

    else {
      print("Not a valid option. Exiting.") } }

  else {
    virtualenv_create("r-posextract", install_python(), packages = c("pandas", "spacy"))
    system(command = "python -m spacy download en_core_web_sm") } }

