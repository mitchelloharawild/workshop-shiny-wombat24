library(shiny)
ui <- fluidPage(
  "Hello, world!"
)
server <- function(input, output, session) {
  # Nothing to see here!
  # All this app does is say "Hello, world!"
}
shinyApp(ui, server)
