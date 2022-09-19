#' Lemmatize 
#'
#' Lemmatize extracted grammatical units.
#'
#' @usage lemmatize()
#'
#' @examples
#' lemmatize(dataframe$col_name)
#'
#' @export
lemmatize <- function(vect) {
  posextract <- import("posextract")
  dataframe <- posextract$lemmatize(vect)
  return(dataframe) }


#output_extractions = [triple.lemmatized() for triple in output_extractions]