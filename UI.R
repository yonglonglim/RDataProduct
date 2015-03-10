shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("BMI Calculation: Should you be worried?"),
    sidebarPanel(
      numericInput('height', 'Your Height (Metres)', 1.7, min = 0, max = 3, step = 0.1),
      numericInput('weight', 'Your Weight (KG)', 70, min = 50, max = 200, step = 1),
      sliderInput("bmislide", "Select your preferred BMI (Green Line)", 
                  min=0, max=70, value=30),
      p('Body Mass Index (BMI) is a number calculated from your weight and height. BMI is a fairly reliable indicator of body fatness for most people.'),
      p('We use the National Health and Nutrition Examination Survey data in 2005 to plot the distribution of BMI.'),
      p('Your BMI result is shown by the red line.'),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Your BMI Score'),
      h4('You have entered that your height is'),
      verbatimTextOutput("inputValue1"),
      h4('You have entered that your weight is'),
      verbatimTextOutput("inputValue2"),
      h4('Which resulted in a BMI of '),
      verbatimTextOutput("prediction"),
      h4('Based on the US Scale, you are'), 
      verbatimTextOutput("verdict"),
      plotOutput("plot")
    )
  )
)
