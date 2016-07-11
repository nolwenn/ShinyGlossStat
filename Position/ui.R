# ui.R
shinyUI(fluidPage(
  titlePanel("Descriptive analysis"),
  
  sidebarLayout(
    sidebarPanel(
      p("We are interested in weight data for 72 young female anorexia patients."),
      br(),
      sliderInput("n", 
                  "Number of observations:", 
                  value = 10,
                  min = 1, 
                  max = 72)
              
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Definition", 
          h3("Mean", align = "left"),
          p("The mean of a data series is the sum of the values divided 
          by the number of values in the data series."),
          code("mean(x, na.rm=T)"),
          h3("Median", align = "left"),
          p("The median is the middle most value in a data series: 
          50% of the values are lower than the median and 50% are higher than the median."),
          code("median(x)"),
          h3("Mode", align = "left"),
          p("The mode is the value that has the highest number of occurrences in a set of data. 
          Unike mean and median, mode can have both numeric and character data."),
          code("mode(x)")
        ),
        
      tabPanel("Apply",verbatimTextOutput("summary"),
               "Plot", plotOutput("plot")), 
      
      tabPanel("Test")
      )
    )
  )
))