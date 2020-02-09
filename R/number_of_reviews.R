# get the number of reviews for a given product.
number_of_reviews <- function(asin){
  paste0("https://www.amazon.it/product-reviews/", asin) %>% xml2::read_html() %>%
    rvest::html_node("[data-hook='cr-filter-info-review-count']") %>% rvest::html_text() %>%
    stringr::str_extract("recensioni su (?s)(.*)") %>% substring(15,) %>% gsub('\\.','', .) %>% as.numeric() %>% return()
}
