# install.packages("shiny")

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Buy a Home in a Major US City!"),
    sidebarPanel(
        h4("This Shiny Application figures out how much money you need to buy your city dream home in US! 
        Just provide your preferences on cost of home, desired square feet and US city in which 
        you want your dream home."),
        numericInput("cashInPocket", "Please Enter Money you wish to Spend on 
                     your Home", 500000, min = 1000, max = 1000000000),
        numericInput("desiredSqFoot", "Please Enter the Desired Square Foot for 
                     your Home", 500, min = 300, max = 1000000),    
        selectInput("currLocation", "Please Select your Current Location",
                    c("San Francisco" = "San Francisco",
                      "Boston" = "Boston",
                      "Washington" = "Washington",
                      "New York" = "New York",
                      "Los Angeles" = "Los Angeles",
                      "San Diego" = "San Diego",
                      "Long Beach" = "Long Beach",
                      "Oakland" = "Oakland",
                      "Seattle" = "Seattle",
                      "Denver" = "Denver",
                      "Austin" = "Austin",
                      "Miami" = "Miami",
                      "Portland" = "Portland",
                      "Charleston" = "Charleston",
                      "Chicago" = "Chicago",
                      "Minneapolis" = "Minneapolis",
                      "Sacramento" = "Sacramento",
                      "Atlanta" = "Atlanta",
                      "Dallas" = "Dallas",
                      "Baltimore" = "Baltimore",
                      "Phoenix" = "Phoenix",
                      "Nashville" = "Nashville",
                      "Fresno" = "Fresno",
                      "Mesa" = "Mesa",
                      "Tucson" = "Tucson",
                      "Colarado Springs" = "Colarado Springs",
                      "Raleigh" = "Raleigh",
                      "Las Vegas" = "Las Vegas",
                      "Philadephia" = "Philadephia",
                      "Charlotte" = "Charlotte",
                      "San Antonio" = "San Antonio",
                      "Houston" = "Houston",
                      "New Orleans" = "New Orleans",
                      "Jacksonville" = "Jacksonville",
                      "Fort Worth" = "Fort Worth",
                      "Arlington" = "Arlington",
                      "Memphis" = "Memphis",
                      "Cleveland" = "Cleveland",
                      "Detroit" = "Detroit")),
        submitButton('Submit')
    ),
    mainPanel(
        h3('Confirming Your Selection'),
        h4('I can Spend'),
        verbatimTextOutput("ocashInPocket"),
        h4('Desired Square Foot'),
        verbatimTextOutput("odesiredSqFoot"),
        h4('And I want a Home in'),
        verbatimTextOutput("ocurrLocation"),
        
        h5("The app produces results for three scenarios: 
        (1) The location  where you can own a city home given that you are not willing 
        to deviate from your budget and square feet
        (2) The money that you need to shell out given that you are not willing to deviate 
        from your location of city home and square feet
        (3) The space in square feet that you definitely need given that you are not willing
           to deviate from your budget and city location"),
        
        h3('The reality!'),
        h4('Money Matters! But, I want the Square Footage too!'),
        h4('With Your Current Budget and required Square Footage,
           you can live in'),
        verbatimTextOutput("pcurrLocation"),
        
        h4('I want my Space! But, Location is everything!'),
        h4('With Your Square Foot and Location preferences, 
           you need to shell out'),
        verbatimTextOutput("pcashInPocket"),
        
        h4('Location IS everything! But, of course! Money Matters!'),
        h4('With Your Location preference and Current Budget, 
           you can Buy the following Square Footage'),
        verbatimTextOutput("pdesiredSqFoot"),
        
        h6("Limitations of the application
            (1) Data is based off article in Business Insider on Mar, 11 2014. 
            The data is sourced from Movoto and Zillow
            (2) The results are only for the year of 2014, as the data is for 2014
            (3) The cost of home is the calculated using median price per square 
            foot for wach city in 2014 ")
    )
))
 
