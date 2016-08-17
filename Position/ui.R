# ui.R
shinyUI(fluidPage(
  titlePanel("Descriptive analysis"),
  
  sidebarLayout(
    sidebarPanel(
      p("Using the weight data of 72 young female anorexia patients, 
        we can compute and visuliaze the mean, median and mode for all or part of the observations. 
        Look at the 'Apply' tab, what does that tell you?"),
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
          code("mean(x, ...)"),
          p(em("Example: If a child eats 2, 4, 5, 3, 3, 3, and 4 cookies per day over a week, he eats on average (2+4+5+3+3+3+4)/7 = 3.4 per day")),
          h3("Median", align = "left"),
          p("The median is the middle most value in a data series: 
          50% of the values are lower than the median and 50% are higher than the median."),
          code("median(x, ...)"),
          p(em("Example: If a child eats 2, 4, 5, 3, 3, 3, and 4 cookies per day over a week, his median is 3 (value of the middle after increasing sorting). In other words, 50% of the days of a week he eats 3 or less and the other days he eats 3 or more.")),
          h3("Mode", align = "left"),
          p("The mode is the value that has the highest number of occurrences in a set of data. 
          Unike mean and median, mode can have both numeric and character data."),
          code("no default function"),
          p(em("Example: If a child eats 2, 4, 5, 3, 3, 3, and 4 cookies per day over a week, he most often eats 3 cookies; the mode is 3.")
          )),
        
      tabPanel("Apply",verbatimTextOutput("summary"),
               "Plot", plotOutput("plot")), 
      
      tabPanel("Test")
      )
    )
  )
))