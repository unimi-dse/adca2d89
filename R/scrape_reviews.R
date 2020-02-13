#' Scrape Reviews
#'
#' Gives the title, content and given star of any product on amazon.it
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
#'  scrape_reviews("8845290034", 1)
#' }
#'
#' @export
#'
#'@importFrom magrittr '%>%'
#'
scrape_reviews <- function(asin, page_number) {

  paste0("https://www.amazon.it/product-reviews/",asin,"/?pageNumber=",page_number) %>% xml2::read_html() -> doc

  doc %>% # Review Title
    rvest::html_nodes("[class='a-size-base a-link-normal review-title a-color-base review-title-content a-text-bold']") %>%
    rvest::html_text() -> review_title

  doc %>% # Review Text
    rvest::html_nodes("[class='a-size-base review-text review-text-content']") %>%
    rvest::html_text() -> review_text

  doc %>% # Number of stars in review
    rvest::html_nodes("[data-hook='review-star-rating']") %>%
    rvest::html_text() -> review_star

  data.frame(title = (review_title %>% substring(19,nchar(review_title)-4)),
             text = (review_text %>% substring(19,nchar(review_text)-4)),
             star = (review_star %>% substring(1, 1))) %>% return()

}
