# get the ASIN of the product. ASIN is the unique id that Amazon gives for every product
get_asin <- function(url){
  xml2::read_html(url) %>% rvest::html_node("[id='ASIN']") %>% rvest::html_attr("value") %>% return()
}
