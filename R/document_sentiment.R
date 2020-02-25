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
  compound_terms <- c('non', 'senza', 'molto', 'poco', 'troppo', 'smesso', 'tanto')
  words <- strsplit (gsub ('[[:punct:] ]+', ' ', tolower (document)), ' ')
  sentestimate <- 0
  compound_flag <- FALSE
  compound_term <- character()
  effective_terms <- c ()
  num_terms <- 0
  for (word in words[[1]]) {
    if (nchar(word) < 3) {
      next
    }
    if (compound_flag == TRUE) {
      word <- paste0 (compound_term, '_', word) #change the word to its compound form if the flag is TRUE
    }
    sentiment <- sentimeter::term_sentiment (word)
    if (sentiment != 0) {
      sentestimate <- sentestimate + sentiment
      effective_terms <- append (effective_terms, word) #list of the terms found in the lexicon
      num_terms <- num_terms + 1 #number of the terms found in the lexicon
    }
    if (word %in% compound_terms) { #check if the word is one of the compound terms, turn the flag on, so the next word will be compounded
      compound_flag <- TRUE   #becareful that the compound terms themselves should not be in the lexicon
      compound_term <- word
    } else {
      compound_flag <- FALSE
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
