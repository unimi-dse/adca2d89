# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  # Generate a summary of the dataset ----
  output$summary <- renderPrint({
    #dataset <- datasetInput()
    if (input$amazon_url == "") {
      cat("Please enter the address of the product on amazon.it\nin the given box on sidebar.")
    } else {
      cat(paste("ASIN:", sentimeter::get_asin(input$amazon_url)))
      cat('\n')
      cat(paste("Number of reviews:", sentimeter::number_of_reviews(sentimeter::get_asin(input$amazon_url))))
      sentimeter::sentiment_analysis(sentimeter::scrape_reviews(asin, 1))
    }
  })
}
