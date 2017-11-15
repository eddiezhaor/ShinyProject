
library(shiny)
library(caret)
library(ggplot2)
library(ISLR)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
       
  output$distPlot <- renderPlot({
          data("Wage")
          ##Get training
          set.seed(111)
          intrain<-createDataPartition(y=Wage$wage, p=0.7, list=FALSE)
          training<-Wage[intrain,]
          fit<-train(wage~age+jobclass+education, method="lm", data=training)
          pred<-predict(fit, data.frame(age=input$age,
                                        jobclass=input$jobclass,
                                        education=input$education))
          
         ggplot(Wage, aes(age,wage))+geom_point(alpha=0.5)+geom_smooth(method="lm")+
                 geom_vline(xintercept =input$age,color="green")+
                 geom_hline(yintercept = pred, color="red")+
                 scale_y_continuous(breaks=seq(0,150,20))+
                 scale_x_continuous(breaks=seq(0,100,5))
               
  })
  output$result<-renderText({
          set.seed(111)
          intrain<-createDataPartition(y=Wage$wage, p=0.7, list=FALSE)
          training<-Wage[intrain,]
          fit<-train(wage~age+jobclass+education, method="lm", data=training)
          pred<-predict(fit, data.frame(age=input$age,
                                        jobclass=input$jobclass,
                                        education=input$education))
          pred<-paste(round(pred, digits = 2), "$")
          pred
  })
})
