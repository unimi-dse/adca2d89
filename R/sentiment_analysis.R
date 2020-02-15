#' Sentiment Analysis
#'
#' Analyze the sentiment of reviews using exclusive sentiment lexicon and reports them
#'
#' @param asin character. ASIN of the product.
#' @param page_number numeric. The page that user want to scrape reviews.
#'
#' @return data.frame
#' \describe{
#'   \item{title}{Title of the review}
#'   \item{text}{Content of the review}
#'   \item{star}{Number of stars}
#' }
#'
#' @examples
#' \dontrun{
#'  sentiment_analysis("8845290034", 1)
#' }
#'
#' @export
#'
#'@importFrom magrittr '%>%'
#'
sentiment_analysis <- function (reviews) {
  i <- 1
  cat('\n\n')
  for (review in reviews$text) {
    report <- document_sentiment (review)
    cat('---------------------------------\n')
    writeLines (strwrap (review, width = 70))
    cat('\n')
    if (report$sentimate != 0) {
      cat (paste0('Sentimate: ', round(report$sentimate, digits = 0), ' (', round(report$sentimate, digits = 2), ')'))
      cat ('\n')
      cat ('First five effective terms: ')
      cat (paste0 (head (report$effective_terms, 5), ', '))
    } else {
      writeLines (strwrap ('Unfortunately we could not detect any sentimentally significant term! This could be result of very short review or a review in another language.', width = 70))
    }
    cat ('\n')
    cat (paste0 ('Given star(s): ', reviews$star[i]))
    cat ('\n')
    i <- i + 1
  }
}
