#' Number of the Review Pages
#'
#' Gives the number of the review pages of any product, by receiving its number of reviews.
#'
#' @param number_of_reviews number. number of the reviews of the product on amazon.it
#'
#' @return numeric. The number of review pages for that product.
#'
#' @examples
#' \dontrun{
#'  number_of_review_pages(6329)
#' }
#'
number_of_review_pages <- function(number_of_reviews) {

  number_of_reviews %>% `/`(10) %>% ceiling() %>% return()

}
