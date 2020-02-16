#' Document Sentiment
#'
#' Analyze the sentiment of A document using exclusive sentiment lexicon
#'
#' @param document character. The document that we want to analyze
#'
#' @return list
#'
#' @examples
#' \dontrun{
#'  document_sentiment ("Questa è una frase di esempio.")
#' }
#'
#' @export
#'
document_sentiment <- function (document) {
  words <- strsplit (gsub ('[[:punct:] ]+', ' ', tolower (document)), ' ')
  sentestimate <- 0
  non_flag <- FALSE
  effective_terms <- c ()
  num_terms <- 0
  for (word in words[[1]]) {
    if (non_flag == TRUE) {
      word <- paste0 ('non_', word) # change the word to its 'non_' form if the flag is TRUE
    }
    sentiment <- sentimeter::term_sentiment (word)
    if (sentiment != 0) {
      sentestimate <- sentestimate + sentiment
      effective_terms <- append (effective_terms, word) # list of the terms found in the lexicon
      num_terms <- num_terms + 1 # number of the terms found in the lexicon
    }
    if (word == 'non') { # check if the word is 'non', turn the flag on, so the next word will be compounded
      non_flag <- TRUE   # becareful that is term 'non' shouldn't be in the lexicon
    } else {
      non_flag <- FALSE
    }
  }
  if (num_terms != 0) {
    sentimate <- (sentestimate / num_terms)
  } else {
    sentimate <- 0
  }
  sentiment_report <- list ("sentimate" = sentimate, "num_terms" = num_terms, "effective_terms" = effective_terms)
  return (sentiment_report)
}
