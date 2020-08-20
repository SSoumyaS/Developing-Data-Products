library(shiny)
library(plotly)
library(markdown)

shinyUI(fluidPage(
  navbarPage("Statistical Distribution",
             tabPanel("Introduction",
                      titlePanel("About the App"),
                      br(),
                      p("The app provides a interface to the user to explore
                        various types of statistical functions. The user can visualise the
                        distributions and can explore the variation by varying different
                        properties of the distribution. It has two tabs: (1) to explore the
                        different distribution and (2) to explore the distribution of the 
                        simulated sample means of respective distributions. Hope, you will
                        find the app useful as well as informative."),
                      br(),
                      p("N.B. The idea for the app comes from the final course project
                        for the Coursera course on Statistical Interference by John Hopkins University
                        . The current app is meant for the final project submission for Developing Data
                        Products course on Coursera by John Hopkins University")
                      ),
             
             tabPanel("Function Distribution",
                      titlePanel("Visualising different Distributions types"),
                      br(),
                      p("Make the proper selections to see the different distribution types"),
                      br(),
                      sidebarPanel(
                        radioButtons("dist", "Distribution type:",
                                     c("Normal" = "norm",
                                       "Uniform" = "unif",
                                       "Log-normal" = "lnorm",
                                       "Exponential" = "exp")),
                        sliderInput("slider4","Set the seed",500,1000,500),
                        sliderInput("slider5","Select Sample Size",30,100,30),
                        sliderInput("slider6","Mean / lambda value",0,1,0),
                        p("N.B. Keep it 0 for all distributions except for exponential")
                        ),
                      mainPanel(
                        plotlyOutput("plot1")
                      )
             ),

             tabPanel("Sample Mean Distribution",
                      titlePanel("Distribution of different Distribution Sample Means"),
                      br(),
                      p("Here we simulate 1000 samples for the selected distribution type
                          and calculate the mean for each sample. Make the selections to see
                          the distribution of sample means for a distribution type and 
                          see how it is different from respective distribution type."),
                      br(),
                      sidebarPanel(
                        radioButtons("dist", "Distribution type:",
                                     c("Normal" = "norm",
                                       "Uniform" = "unif",
                                       "Log-normal" = "lnorm",
                                       "Exponential" = "exp")),
                        sliderInput("slider1","Set the seed",500,1000,500),
                        sliderInput("slider2","Select Sample Size",30,100,30),
                        sliderInput("slider3","lambda value",0,1,0),
                        p("N.B. Keep it 0 for all distributions except for exponential")
                        ),
                      mainPanel(
                        plotlyOutput("plot2")
                        ))
           )
  ))         
