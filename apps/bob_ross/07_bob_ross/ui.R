library(shiny)

fluidPage(
  titlePanel("Bob Ross painting contents"),
  theme = shinythemes::shinytheme("superhero"),
    
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
      tabsetPanel( 
        tabPanel("Plot", 
                 "Frequency of elements in paintings",
                 echarts4rOutput("plot_proportion", height = "800px")
        ), 
        tabPanel("Table", 
                 # Table output
                 "Top 10 most common elements",
                 tableOutput("data_proportion")
        )
      )
    )
  )
)
