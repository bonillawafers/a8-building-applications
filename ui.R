library(shiny)
library(dplyr)
library(plotly)

data("iris")

shinyUI(fluidPage(
  
  titlePanel("Flower Petals"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("radio", label = h3("Select Species:"),
                   choices = list("Setosa" = "setosa", "Versicolor" = "versicolor", "Virginica" = "virginica"), 
                   selected = "setosa"),
      actionButton("render", "Show me the flowers"),
      sliderInput("obs", label = h3("Number of Observations:"), min = 0, 
                  max = 50, value = 25)
    ),
    mainPanel(
      plotlyOutput("bubble")
    )
  )
))