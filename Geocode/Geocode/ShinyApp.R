library(shiny)
#library(Geocode)
#source("API.R")

#UI function for shiny

ui <- fluidPage(
  h3(headerPanel("Address fetching using Geocode API"),align = "center"),
  sidebarLayout(
    sidebarPanel( 
                  
      textInput("var", label = "Write the location name")),
    

mainPanel(tableOutput("return"),
          textOutput("print"))
)
)

#server function for shiny
server <- function(input, output) {
  
  output$print <- renderPrint(
    geocode_api(input$var) 
  )
  
  output$return <- renderTable({
    geocode_api(input$var)},align = NULL, striped = TRUE, hover = TRUE, bordered = TRUE,
    colnames = FALSE, rownames = FALSE)

}
# Run the application
shinyApp(ui = ui, server = server)