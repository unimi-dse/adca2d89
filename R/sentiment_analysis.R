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
sentiment_analysis <- function(reviews) {
  lexpath <- system.file("extdata", "sentilexiconit.rds", package = "sentimeter")
  sentilexiconit <- readRDS(lexpath)
  i <- 1
  cat('\n\n\n')
  for (each_review in reviews$text) {
    words <- strsplit(gsub('[[:punct:] ]+',' ',each_review), ' ')
    sentestimate <- 0
    sent_num <- 0
    for (word in words[[1]]) {
      iter <- 1
      for (term in sentilexiconit[[1]]) {
        if (term == word) {
          sent_num <- sent_num + 1
          sentestimate <- sentestimate + sentilexiconit[[2]][iter]
          break
        }
        iter <- iter + 1
      }
    }
    sentimate <- sentestimate/sent_num
    if (sentimate > 5) {
      sentimate <- 5
    }
    writeLines(strwrap(each_review, width = 70))
    cat('\n')
    cat(paste0('Estimated star: ', round(sentimate, digits = 0), ' (', round(sentestimate/sent_num, digits = 2), ')'))
    cat('\n')
    cat(paste('Given star(s):', reviews$star[i]))
    cat('\n')
    cat('--------------------------')
    cat('\n')
    i <- i + 1
  }
}
