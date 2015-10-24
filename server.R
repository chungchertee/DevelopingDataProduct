#server.R

# use rnorm or rbinorm or rbinorm(1,1,0.5) with if-else statement to dicate which sample to choose
library(ggplot2)
library(grid)
library(dplyr)


randomsamplechoices <- rbinom(1,1,0.5)

if (randomsamplechoices) {
  randomsample1 <- sample(1:12, replace = TRUE)
  totalrandomsample1 <- sum(randomsample1)
  originalmean <- mean(randomsample1)

}

if (!randomsamplechoices) {
  randomsample2 <- sample(1:10, replace = TRUE)
  totalrandomsample2 <- sum(randomsample2)
  originalmean <- mean(randomsample2)
}


shinyServer(
  function(input, output) {
    
  mean1 <- eventReactive(input$goButton1, {
    if (randomsamplechoices){
      ((input$set1firstinputnumber+input$set1secondinputnumber + totalrandomsample1)/14)
    }
    
    if (!randomsamplechoices){
      ((input$set1firstinputnumber+input$set1secondinputnumber + totalrandomsample2)/12)
    }    
  })
  output$firstcalmean <- renderText({mean1()})    
  
  mean2 <- eventReactive(input$goButton2, {
    if (randomsamplechoices){
      ((input$set2firstinputnumber+input$set2secondinputnumber + totalrandomsample2)/14)
    }
    if (!randomsamplechoices){
      ((input$set2firstinputnumber+input$set2secondinputnumber + totalrandomsample2)/12)
    }
  })  
  output$secondcalmean <- renderText({mean2()})
 
  rightorwrong <- eventReactive(input$goButton3, {
    if (input$guessmean==round(originalmean,digits = 0))
    "You are Correct!"
    else "Sorry, you are wrong" 
    })
  output$correctorwrong <- renderText({rightorwrong()})
  

  output$plotrandomsample <- renderPlot({
    if ((input$goButton4 == 1) && randomsamplechoices)
      plot(randomsample1, xlab="Random sample of 12 numbers")
    else if ((input$goButton4==1) && !randomsamplechoices)
        plot(randomsample2, xlab="Random sample of 10 numbers")
    else "Press to plot"
    })
  })
