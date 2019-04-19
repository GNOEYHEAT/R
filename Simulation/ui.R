ui <- fluidPage(
  
  tags$head(
    tags$style(HTML("
                    #event{
                      font-size: 18px;
                      font-weight: bold;
                    }
                    "))
  ),
  
  titlePanel("Simulation"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput(inputId = "x",
                  label = "x range",
                  min = 900,
                  max = 1351,
                  value = 1351),
      
      sliderInput(inputId = "y",
                  label = "y range",
                  min = 3182,
                  max = 4773,
                  value = 4773),
      
      numericInput(inputId = "y_unit",
                  label = "y_unit",
                  min = 3,
                  max = 6,
                  value = 3.533,
                  step = 0.001),
      
      h4("Total Cost"),
      
      verbatimTextOutput("event", placeholder = TRUE)
      
    ),
    
    mainPanel(
      
      plotlyOutput(outputId = "Plot")
      
    )
  )
)
