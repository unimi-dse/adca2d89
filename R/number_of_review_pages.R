# calculate number of review-pages for a given number of reviews
number_of_review_pages <- function(number_of_reviews){
  number_of_reviews %>% `/`(10) %>% ceiling() %>% return()
}
