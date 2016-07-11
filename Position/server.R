library(MASS)
data(anorexia)

shinyServer(function(input, output) {
  
  output$plot<-renderPlot({
  ggplot(anorexia[1:input$n,], aes(x = 1:length(Prewt), y = Prewt)) +
    labs(title = "", x = "Individuals", y = "Weight (lbs)") +
    geom_point() 
    ##geom_point(data = ds, aes(y = mean),
    ##           colour = 'red', size = 3)
  })
  
  output$summary <- renderPrint({
    x = anorexia$Prewt[1:input$n]
    c("Mean"= mean(x), "Median"= median(x))
  })
  
})