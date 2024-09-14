library(shiny)
fluidPage(
  titlePanel("Bob Ross painting contents"),
  sidebarLayout(
    sidebarPanel(
      # Joy of painting title image
      img(src = "joy_of_painting.jpg", width = "100%"),
      # Season selector
      sliderInput(inputId = "seasons",
                  label = "Included seasons:",
                  min = min(elements$season),
                  max = max(elements$season),
                  value = range(elements$season))
    ), 
    mainPanel(
      # Plot output
      "Frequency of elements in paintings",
      plotOutput(outputId = "plot_proportion", height = "800px"),
      # Table output
      "Top 10 most common elements",
      tableOutput(outputId = "data_proportion")
    ) 
  )
)