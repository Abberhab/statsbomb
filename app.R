#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("flatly"),navbarPage("Statistik over fodboldspillere",
                                                        tabPanel("Skudforsøg",
                                                                 sidebarPanel(
                                                                   selectInput("land1",
                                                                               label = " Vælg land",
                                                                               choices = c("Denmark", "Polen"),
                                                                               selected = "Denmark"),
                                                                   selectInput("season1",
                                                                               label = "Vælg sæson",
                                                                               choices = c("21/22"),
                                                                               selected = "21/22"),
                                                                   selectInput("faktor1",
                                                                               label = "Vælg faktor",
                                                                               choices = NULL),
                                                                   selectInput("minut1",
                                                                               label = "Vælg minut interval",
                                                                               choices = c("Hele kampen","0-9", "10-19", "20-29", "30-39", "40-49", "50-59", 
                                                                                           "60-69", "70-79", "80-89", "90+"),
                                                                               selected = "Hele kampen"),
                                                                 ),
                                                                 mainPanel(
                                                                   plotOutput("TopBundPlot"),
                                                                 )
                                                        ),
                                                        tabPanel("Målramme",
                                                                 sidebarPanel(
                                                                   selectInput("L",
                                                                               label = " Vælg land",
                                                                               choices = c("Holland", "Polen"),
                                                                               selected = "Polen"),
                                                                   selectInput("plname1",
                                                                               label = "Vælg spiller",
                                                                               choices = ""),
                                                                   selectInput("Skud1",
                                                                               label = "Skal den være indenfor målrammen?",
                                                                               choices = c("Ja", "Nej", "Blandet"),
                                                                               selected = "Blandet"),
                                                                   tableOutput("playerstat1")
                                                                 ),
                                                                 mainPanel(
                                                                   plotOutput("målramme"),
                                                                   fluidRow(
                                                                     column(width = 8,
                                                                            dataTableOutput("playertab1")  
                                                                     )
                                                                   )
                                                                 )
                                                        ),
                                                        tabPanel("Stats",
                                                                 sidebarPanel(
                                                                   selectInput("Land2",
                                                                               label = " Vælg land",
                                                                               choices = c("Holland", "Polen"),
                                                                               selected = "Polen"),
                                                                   selectInput("hold",
                                                                               label = "Vælg hold",
                                                                               choices = ""),
                                                                   selectInput("pval3",
                                                                               label = "Vælg spiller",
                                                                               choices = "")
                                                                 ),
                                                                 mainPanel(
                                                                   plotOutput("Heat_map"),
                                                                   dataTableOutput("hold")
                                                                   
                                                                 )
                                                        )
)
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
