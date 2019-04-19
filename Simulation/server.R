server <- function(input, output) {
  
  output$Plot <- renderPlotly({
    
    for(i in 1:452){
      for(j in 1:1592){
        z[i,j]<<-(b*x[i]*input$y_unit*39+c*(y[j]/input$y_unit-x[i])*input$y_unit*32) # 계산식
      }
    }
    
    # z # 총 비용
    
    plot_ly (
      type = 'surface',
      z = ~z,
      x = x, y = y)
    
  })
  
  output$event <- renderPrint({
    
    z[a-input$x+1, y_0-input$y+1]
    
  })
  
}
