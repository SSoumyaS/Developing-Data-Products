library(shiny)
library(plotly)

shinyServer(function(input, output) {
    
    output$plot1 <- renderPlotly({
        dist1 <- switch(input$dist,
                       norm = rnorm,
                       unif = runif,
                       lnorm = rlnorm,
                       exp = rexp,
                       rnorm)
        set.seed(input$slider4)
        simExmp <- sort(dist1(input$slider5, input$slider6))
        plot_ly(x = ~simExmp, type = "histogram")
    })
    
    output$plot2 <- renderPlotly({
        dist2 <- switch(input$dist,
                        norm = rnorm,
                        unif = runif,
                        lnorm = rlnorm,
                        exp = rexp,
                        rnorm)
        set.seed(input$slider1)
        simMeans = NULL
        for (i in 1 : 1000){
            simMeans <- c(simMeans, 
                          mean(dist2(input$slider2, 
                                    input$slider3)))
        }
        plot_ly(x = ~simMeans, type = "histogram")
    })
})

