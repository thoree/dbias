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
  titlePanel("Display, download BIAS data"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Choose dataset ----
      
      selectInput("dataset", "Choose a dataset:",
                  choices = c("None selected", datasets)),
      
      # Button
      downloadButton("downloadData", "Download")
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      tableOutput("table")
      
    )
    
  )
)

# Define server logic to display and download selected file ----
server <- function(input, output) {
  
  datasetInput <- reactive({
    switch(input$dataset,
           "Audi" = Audi,
           "Barley (barley)" = Barley,
           "Beefcarcasses" = Beefcarcasses,
           "BeerDataClever" = BeerDataClever,
           "BeerDataNotClever" = BeerDataNotClever,
           "BeerTaste" = BeerTaste,
           "Birdcount" = Birdcount,
           "Birds" = Birds,
           "Birds4" = Birds4,
           "Blackbream" = Blackbream,
           "Cakes.miss" = Cakes.miss,
           "D" = D,
           "DISCRIM" = DISCRIM,
           "EX14_1Montg_data" = EX14_1Montg_data,
           "FishData" = FishData,
           "FishingExperiment" = FishingExperiment,
           "Hald.Cement" = Hald.Cement,
           "Hprice" = Hprice,
           "LambDataFactorial" = LambDataFactorial,
           "LambDataNested" = LambDataNested,
           "LifeExp" = LifeExp,
           "ListeriaStore" = ListeriaStore,
           "Lizard" = Lizard,
           "Maldi.test" = Maldi.test,
           "Maldi.test.small" = Maldi.test.small,
           "Maldi.train" = Maldi.train,
           "Maldi.train.small" = Maldi.train.small,
           "NCI60" = NCI60,
           "NSRdata" = NSRdata,
           "OrangeJuice" = OrangeJuice,
           "Orthodont.unstacked" = Orthodont.unstacked,
           "Pear2011" = Pear2011,
           "Pollution" = Pollution,
           "Raman.test" = Raman.test,
           "Raman.train" = Raman.train,
           "RifleTokyoOL" = RifleTokyoOL,
           "STAT210example14.16" = STAT210example14.16,
           "STAT210example2.1" = STAT210example2.1,
           "STAT210example3.1" = STAT210example3.1,
           "STAT210example3.10" = STAT210example3.10,
           "STAT210example4.1" = STAT210example4.1,
           "STAT210example5.1" = STAT210example5.1,
           "STAT210example5.2" = STAT210example5.2,
           "STAT210example5.3" = STAT210example5.3,
           "STAT210example5.6" = STAT210example5.6,
           "STAT210prob2.22" = STAT210prob2.22,
           "STAT210prob2.24" = STAT210prob2.24,
           "STAT210prob2.26" = STAT210prob2.26,
           "STAT210prob2.28" = STAT210prob2.28,
           "STAT210prob2.29" = STAT210prob2.29,
           "STAT210prob2.31" = STAT210prob2.31,
           "STAT210prob2.32" = STAT210prob2.32,
           "STAT210prob2.33" = STAT210prob2.33,
           "STAT210prob2.34" = STAT210prob2.34,
           "STAT210prob2.35" = STAT210prob2.35,
           "STAT210prob2.36" = STAT210prob2.36,
           "STAT210prob2.37" = STAT210prob2.37,
           "STAT210prob2.39" = STAT210prob2.39,
           "STAT210prob2.45" = STAT210prob2.45,
           "STAT210prob2.46" = STAT210prob2.46,
           "STAT210prob3.10" = STAT210prob3.10,
           "STAT210prob3.11" = STAT210prob3.11,
           "STAT210prob3.14" = STAT210prob3.14,
           "STAT210prob3.16" = STAT210prob3.16,
           "STAT210prob3.17" = STAT210prob3.17,
           "STAT210prob3.18" = STAT210prob3.18,
           "STAT210prob3.19" = STAT210prob3.19,
           "STAT210prob3.20" = STAT210prob3.20,
           "STAT210prob3.22" = STAT210prob3.22,
           "STAT210prob3.26" = STAT210prob3.26,
           "STAT210prob4.17" = STAT210prob4.17,
           "SalmonLice" = SalmonLice,
           "SireHerd" = SireHerd,
           "SoyaData" = SoyaData,
           "TrackRecords" = TrackRecords,
           "Trout" = Trout,
           "Wine" = Wine,
           "bears" = bears,
           "birth" = birth,
           "bodydata" = bodydata,
           "boilers" = boilers,
           "city" = city,
           "colon" = colon,
           "crabs" = crabs,
           "exer" = exer,
           "farms" = farms,
           "farms0" = farms0,
           "fertilizer" = fertilizer,
           "foods" = foods,
           "freqsBlind" = freqsBlind,
           "ftccigar" = ftccigar,
           "grades" = grades,
           "hospital" = hospital,
           "infection" = infection,
           "iris.test" = iris.test,
           "iris.train" = iris.train,
           "island" = island,
           "litter" = litter,
           "numbers" = numbers,
           "poems" = poems,
           "poems.test" = poems.test,
           "poinsettia" = poinsettia,
           "quasibin" = quasibin,
           "radiationSmall" = radiationSmall,
           "rats" = rats,
           "reading" = reading,
           "rootGrowth" = rootGrowth,
           "sediments" = sediments,
           "sires" = sires,
           "smoke" = smoke,
           "species" = species,
           "splityield" = splityield,
           "spruce" = spruce,
           "stat210_5Jan2018" = stat210_5Jan2018,
           "stat340_raq_quiz" = stat340_raq_quiz,
           "state.x77" = state.x77,
           "taxa" = taxa,
           "trackfieldrecords" = trackfieldrecords,
           "weights" = weights,
           "yields" = yields,
           "yields.unstacked" = yields.unstacked)
  })
  
  # Table of selected dataset ----
  output$table <- renderTable({
    datasetInput()
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