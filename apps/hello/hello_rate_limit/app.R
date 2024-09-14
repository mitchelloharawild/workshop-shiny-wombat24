library(shiny)
ui <- fluidPage(
  textInput("name", "Enter your name: "),
  "Default:",
  textOutput("greeting"),
  "Debounced:",
  textOutput("greeting_debounce"),
  "Throttled:",
  textOutput("greeting_throttle")
)
server <- function(input, output, session) {
  name_d <- debounce(reactive(input$name), 2000)
  name_t <- throttle(reactive(input$name), 2000)
  output$greeting <- renderText({
    sprintf("Hello %s!", input$name)
  })
  output$greeting_debounce <- renderText({
    sprintf("Hello %s!", name_d())
  })
  output$greeting_throttle <- renderText({
    sprintf("Hello %s!", name_t())
  })
}
shinyApp(ui, server)
