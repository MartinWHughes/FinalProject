
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyUI(fluidPage(
  titlePanel("Visualize the Effect of Transmission Type"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("transType", "Transmission Type:", 
                   c("Automatic" = "auto",
                     "Manual" = "man"))
    ),
    mainPanel(
      plotOutput("plot"),
      h3("Average Horsepower"),
      textOutput("mpg"),
      h3("Instructions"),
      textOutput("inst")
    )
  )
))