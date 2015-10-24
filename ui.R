#ui.R

shinyUI(pageWithSidebar(
  headerPanel("Guess the Mean Game"),
  sidebarPanel(
    h5('Input first set of 2 numbers'),
    numericInput('set1firstinputnumber', 'Your first integer input', 0, min = 0, max = 20, step = 1),
    numericInput('set1secondinputnumber', 'Your second integer input', 0, min = 0, max = 20, step = 1),
    actionButton("goButton1", "Go!"),
    
    h5 ('Input second set of 2 numbers'),
    numericInput('set2firstinputnumber', 'Your first integer input', 0, min = 0, max = 20, step = 1),
    numericInput('set2secondinputnumber', 'Your second integer input', 0, min = 0, max = 20, step = 1),
    actionButton("goButton2", "Go!"),
    
    h5 ('Please mentally calculated the original mean and press Go'),
    numericInput('guessmean', 'Your Guess is:', 0, min = 0, max = 20, step = 1),
    actionButton("goButton3", "Go!"),
    
    h5 ('Plot random sample'),
    actionButton("goButton4", "Go!")

    ),
  mainPanel(
    p('Base on your first input number, the new mean is:'),
    textOutput("firstcalmean"),
    p('Base on your second input number, the new mean is:'),
    textOutput("secondcalmean"),
    p('Mentally calculate the original mean and it is:'),
    textOutput("correctorwrong"),
    plotOutput("plotrandomsample")
  )
))