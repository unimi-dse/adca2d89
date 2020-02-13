#' Number of the Reviews
#'
#' Gives the number of the reviews of any product, by receiving its ASIN.
#'
#' @param asin character. ASIN of the product.
#'
#' @return numerics. Number of the reviews written for the product on amazon.it
#'
#' @examples
#' \dontrun{
#'  number_of_reviews("8845290034")
#' }
#'
#' @export
#'
#'@importFrom magrittr '%>%'
#'
number_of_reviews <- function(asin) {

  paste0("https://www.amazon.it/product-reviews/", asin) %>% xml2::read_html() %>%
  rvest::html_node("[data-hook='cr-filter-info-review-count']") %>% rvest::html_text() %>%
  stringr::str_extract("recensioni su (?s)(.*)") %>% substring(15,) %>% gsub('\\.','', .) %>% as.numeric() %>% return()

}
