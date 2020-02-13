# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    #dataset <- datasetInput()
    if (input$amazon_url == "") {
      cat("Please enter the address of the product on amazon.it\nin the given box on sidebar.")
    } else {
      asin = get_asin(input$amazon_url)
      cat(paste("ASIN:", asin))
      cat('\n')
      cat(paste("Number of reviews:", number_of_reviews(asin)))
      sentiment_analysis(scrape_reviews(asin, 1))
    }
  })
}
