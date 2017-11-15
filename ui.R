

library(shiny)
shinyUI(fluidPage(
  titlePanel("Raw wage Prediction"),
 
  sidebarLayout(
    sidebarPanel(
numericInput("age", "Age",value="20", min=5, max=120),
selectInput("education","Choose your education:",
            list("1. < HS Grad"="1. < HS Grad","2. HS Grad"="2. HS Grad",
            "3. Some College"="3. Some College","4. College Grad"="4. College Grad","5. Advanced Degree"="5. Advanced Degree")),
selectInput("jobclass","Choose your jobclass:", list("1. Industrial"="1. Industrial", 
                                                     "2. Information"="2. Information")),
submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
            
       plotOutput("distPlot"),
       h3("Your Wage: "),
       textOutput("result")
      
    )
  )
))
