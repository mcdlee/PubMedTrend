#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(RISmed)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

   string <- reactive(input$searchString)
   pubmed_data <- reactive(searchText(string()))
   plot <- reactive(histByTime(pubmed_data()))
   
   output$plot <- renderPlot(plot())
   }
)
