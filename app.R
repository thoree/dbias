#
# This is a Shiny web application designed to provide information on
# the datasets of the R library BIAS.data
#

library(shiny)
library(BIAS.data)

datasets = data(package = "BIAS.data")$results[,3]

# Define UI for data download app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Display and download from R library BIAS.data"),

  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Choose dataset ----
      
      selectInput("dataset", "Choose a dataset:",
                  choices = datasets,
                  selected = "Audi"),
      
      numericInput("nColumns", "No of columns to show:", 5, 1, 100),
      
      # Button
      downloadButton("downloadData", "Download")
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      dataTableOutput("table")
      
    )
    
  )
)

# Define server logic to display and download selected file ----
server <- function(input, output) {
  
  datasetInput <- reactive({
    getAnywhere(input$dataset)$objs[[1]]
  })

  
  # Table of selected dataset ----
  output$table <- renderDataTable({
    d <- datasetInput()   
    d[,1:min(input$nColumns, ncol(d))]
  })
  
  # Downloadable csv of selected dataset ----
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$dataset, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
    }
  )
  
}

# Create Shiny app ----
shinyApp(ui, server)