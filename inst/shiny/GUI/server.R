# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {

  # Return the requested dataset ----
  #datasetInput <- reactive({
  #  switch(input$dataset,
  #         "avvali" = cars,
  #         "pressure" = dovvomi,
  #         "cars" = sevvomi)
  #})

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
    }
  })

  # Show the first "n" observations ----
  #output$view <- renderTable({
  #  datasetInput()$input$obs
  #})

}
