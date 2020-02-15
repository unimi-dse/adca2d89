#' Term Sentiment
#'
#' Analyze the sentiment of a word using exclusive sentiment lexicon
#'
#' @param document list The word that we are looking for its sentiment
#'
#' @return list
#'
#' @examples
#' \dontrun{
#'  term_sentiment ("perfetto")
#' }
#'
#' @export
#'
term_sentiment <- function (word) {
  path <- system.file ("extdata", "lexicon.rds", package = "sentimeter")
  lexicon <- readRDS (path)
  sentiment <- 0
  iter <- 1
  for (term in lexicon[[1]]) {
    if (term == word) {
      sentiment <- lexicon[[2]][iter]
      break # if the word found in the lexicon, we're finished!
    }
    iter <- iter + 1
  }
  return(sentiment)
}
