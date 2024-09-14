library(shiny)

fluidPage(
  titlePanel("Bob Ross painting contents"),
  
  sidebarLayout(
    sidebarPanel(
      # Joy of painting image
      img(src = "joy_of_painting.jpg", width = "100%"),
      
      # Season selector
      sliderInput("seasons",
                  "Included seasons:",
                  min = min(elements$season),
                  max = max(elements$season),
                  value = range(elements$season)),
      
      # Element selector
      selectizeInput("elements",
                     "Paintings containing:",
                     choices = unique(elements$element),
                     multiple = TRUE)
    ),
    
    mainPanel(
      # Plot output
      "Frequency of elements in paintings",
      plotOutput("plot_proportion", height = "800px"),
      
      # Table output
      "Top 10 most common elements",
      tableOutput("data_proportion")
    )
  )
)
