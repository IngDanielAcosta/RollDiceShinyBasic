#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Lanzamiento de dados"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("veces","lanzamientos",value = 10),
            actionButton("boton","aplicar"),
            p("Con un lanzamiento, solo se muestra un dado")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            #textOutput("actb"),
            plotOutput("graf"),
            #plotOutput()
        )
    )
))
