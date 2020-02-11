#' Get ASIN
#'
#' Gives the ASIN of any product, by receiving its web address.
#'
#' @param url character. URL of the product on amazon.it
#'
#' @return character. The ASIN of the product.
#'
#' @examples
#' \dontrun{
#'  get_asin("https://www.amazon.it/Tutti-gli-scritti-Platone/dp/8845290034")
#' }
#'
#' @export
#'
get_asin <- function(url) {

  xml2::read_html(url) %>% rvest::html_node("[id='ASIN']") %>% rvest::html_attr("value") %>% return()

}
