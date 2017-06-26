
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyServer(function(input, output) {
  autocars <- subset(mtcars, am == 0)
  mancars <- subset(mtcars, am == 1)
  modelauto <- lm(mpg ~ hp, data = autocars)
  modelman <- lm(mpg ~ hp, data = mancars)
  mtcars$color = "red"
  mtcars$color[mtcars$am == 1]="blue"
  autoavg = mean(autocars$mpg)
  manavg = mean(mancars$mpg)
  
  output$plot <- renderPlot({
    plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower", 
         ylab = "Miles Per Gallon", bty = "n", pch = 16, col=mtcars$color)
    if (input$transType == "auto") {
      abline(modelauto, col = "red", lwd = 2)
    } else {
      abline(modelman, col = "blue", lwd = 2)
    }
    legend("topright", col = c("red", "blue"), legend = c("auto", "manual"),lty=1 )
  })
  
  output$mpg <- renderText({
    if (input$transType == "auto") {
      round(autoavg, 2)
    } else
      round(manavg, 2)
  })
  
  output$inst <- renderText({
    "Select the transmission type on the left to see the impact on MPG"
  })
  
})