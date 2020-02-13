# Define UI for dataset viewer app ----
ui <- fluidPage(

  # App title ----
  titlePanel("Italian Amazon Reviews Sentiment Analysis Toolkit!"),

  # Sidebar layout with a input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Text entry for URL of the product to view ----
      textInput(inputId = "amazon_url",
                label = "Enter the address on amazon.it",
                value = "",
                placeholder = "https://www.amazon.it/Tutti-gli-scritti-Platone/dp/8845290034"),

      submitButton(text = "submit", icon = NULL, width = NULL)
    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Verbatim text for data summary ----
      verbatimTextOutput("summary"),

    )
  )
)
