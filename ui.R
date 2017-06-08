#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(RISmed)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("PubMed Trend"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      textInput("searchString", label="searchString", width="400px", value ="transient ischemic dilatation"),
      actionButton("goButton", "Go!")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot", width="100%", height="400px")
    )
  )
))
