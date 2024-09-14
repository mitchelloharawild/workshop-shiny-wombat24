library(shiny)
ui <- fluidPage(
  actionButton("add", "Increment"),
  actionButton("reset", "Reset"),
  textOutput("total")
)
server <- function(input, output, session) {
  num <- reactiveVal(0L)
  observe({
    # Despite not changing the output, this adds the button as a trigger dependency
    input$add
    
    num(num() + 1L)
  })
  
  observeEvent(input$reset, {
    num(0L)
  })
  
  output$total <- renderText({
    num()
  })
}
shinyApp(ui, server)
