library(shiny)
library(r2d3globe)

ui <- fluidPage(
    titlePanel("Hello World! (like, literally)"),
    globeSvgInput("globeInput"),
    textOutput("textOut")
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$textOut <- renderText({
       paste0("Input value: ", input$bins)
    })
}

# Run the application
shinyApp(ui = ui, server = server)
