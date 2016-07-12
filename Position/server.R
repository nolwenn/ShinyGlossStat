library(MASS)
library(ggplot2)
data(anorexia)



shinyServer(function(input, output) {
  anorexia$Prewt <- round(anorexia$Prewt,0)
  
  output$plot<-renderPlot({
    ds <-c("mean"=mean(anorexia$Prewt), "median"=median(anorexia$Prewt))
    ggplot(anorexia[1:input$n,], aes(x = 1:length(Prewt), y = Prewt)) +
    labs(title = "", x = "Individuals", y = "Weight (lbs)") +
    geom_point() + 
    geom_hline(aes(yintercept=mean(anorexia$Prewt[1:input$n]), color="mean")) +
    geom_hline(aes(yintercept=median(anorexia$Prewt[1:input$n]), color="median"))
    #geom_smooth(method=lm,   # Add linear regression lines
    #              se=FALSE,    # Don't add shaded confidence region
    #              fullrange=TRUE)
  })
  
  output$summary <- renderPrint({
    x = round(anorexia$Prewt[1:input$n],0)
    getmode <- function(v) {
      w = table(v)
      m= w[max(w)==w]
      if(m==1) {return(NA)}
      else{return(m)}
    }
    c("Mean"= mean(x), "Median"= median(x), "Mode"=getmode(x))
  })
  
})