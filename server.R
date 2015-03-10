BMI <- function(height, weight) weight / height^2
# Below 18.5  Underweight
# 18.5 - 24.9	Normal
#25.0 - 29.9	Overweight
#30.0 and Above	Obese
library(Hmisc)
data <- read.csv("data.csv")
den<- density(data$data.bmxbmi, na.rm=TRUE)
hist(data$data.bmxbmi, 
     xlab=("BMI"), 
     main=("Histogram of BMI across USA in 2005"),
     probability=TRUE,
     col="lightblue",
     breaks=20)
lines(den,col="blue", lwd=2)

shinyServer(
  function(input, output) {
    output$inputValue1 <- renderPrint({input$height})
    output$inputValue2 <- renderPrint({input$weight})
    output$prediction <- renderPrint({BMI(input$height,input$weight)})
    output$verdict <- renderPrint(if(BMI(input$height,input$weight)>30) {'Obese'}
                                  else if (BMI(input$height,input$weight)<18.5) {'Underweight'}
                                  else if (BMI(input$height,input$weight)>=18.5 & (BMI(input$height,input$weight)<24.9)) {'Normal'}
                                  else if (BMI(input$height,input$weight)>=25 & (BMI(input$height,input$weight)<29.9)) {'Overweight'})
    output$plot <- renderPlot({
      hist(data$data.bmxbmi, 
           xlab=("BMI"), 
           main=("Histogram of BMI across USA in 2005"),
           probability=TRUE,
           col="lightblue",
           breaks=20)
      lines(den,col="blue", lwd=2)
      abline(v=BMI(input$height,input$weight), lwd=3, col="red")
      abline(v=input$bmislide,lwd=2,col="green")
    })
  }
  
)