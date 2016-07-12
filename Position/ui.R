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
          p("The mean of a data series is the sum of the values divided by the number of values in the data series."),
          p("Example 1: if a child eats 2, 4, 5, 3, 3, 3, and 4 cookies per day over a week, he eats on average (2+4+5+3+3+3+4)/7 = 3.4 per day"),
          code("mean(x)"),
          h3("Median", align = "left"),
          p("The median is the middle most value in a data series: 
          50% of the values are lower than the median and 50% are higher than the median."),
          p("Example 1: if a child eats 2, 4, 5, 3, 3, 3, and 4 cookies per day over a week, his median is 3 (value of the middle after increasing sorting). In other words, 50% of the days of the week he eats 3 or less than 3 cookies and the other days he eats 3 or more."),
          code("median(x)"),
          h3("Mode", align = "left"),
          p("The mode is the value that has the highest number of occurrences in a set of data. 
          Unike mean and median, mode can have both numeric and character data."),
          p("Example 1: if a child eats 2, 4, 5, 3, 3, 3, and 4 cookies per day over a week, he most often eats 3 cookies; the mode is 3."),
          code("mode(x)")
        ),
        
      tabPanel("Apply",verbatimTextOutput("summary"),
               "Plot", plotOutput("plot")), 
      
      tabPanel("Test")
      )
    )
  )
))