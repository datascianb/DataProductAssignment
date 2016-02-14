
library(shiny)


locationList <- c("San Francisco", "Boston", "Washington", "New York",
                  "Los Angeles", "San Diego", "Long Beach",
                  "Oakland", "Seattle", "Denver", "Austin", "Miami",
                  "Portland", "Charleston", "Chicago", "Minneapolis", "Sacramento",
                  "Atlanta", "Dallas", "Baltimore", "Phoenix",
                  "Nashville", "Fresno", "Mesa", "Tucson", "Colarado Springs",
                  "Raleigh", "Las Vegas", "Philadephia", "Charlotte",
                  "San Antonio", "Houston", "New Orleans", "Jacksonville",
                  "Fort Worth", "Arlington", "Memphis", "Cleveland",
                  "Detroit")

costperSFList <- c(1502, 2092, 2198, 2358, 2375, 2899, 2933, 3460, 3472, 5025,
                  5128, 5291, 5348, 5917, 6173, 6536, 6579, 6849, 7042, 7692,
                  7937, 8130, 8264, 8403, 8772, 8850, 8850, 9259, 9346, 10204,
                  10526, 10753, 11364, 11765, 11765, 12346, 15625, 21739, 
                  83333)

df <- data.frame(locationList, 1000000/costperSFList)
names(df) <- c("Location", "CostperSqFt")

real_home_location <- function(ocashInPocket, odesiredSqFoot) {

    r_costperSF <- ocashInPocket / odesiredSqFoot
    
    dfLocation <-subset(df, df$CostperSqFt <= r_costperSF)
    
    if (nrow(dfLocation) == 0){
        print("You new either more money or less space specifications for the given Location")
    } else {
        dfLocation <- dfLocation[order(dfLocation$CostperSqFt, decreasing = TRUE), ]
        as.character(head(dfLocation$Location, 1))
    }
}

real_money <- function(odesiredSqFoot, ocurrLocation) {
    
    reqDol <- odesiredSqFoot * df$CostperSqFt
    
    dfMoneyBind <- df
    dfMoneyBind$reDol <- reqDol
    
    if(odesiredSqFoot <= 0){
        print("Imaginary space costs nothing")    
    } else {
        dfMoney <- subset(dfMoneyBind, dfMoneyBind$Location == ocurrLocation)
        paste0("$ ", round(dfMoney$reDol))
    }
}

real_sq_ft <- function(ocashInPocket, ocurrLocation) {
    
    rSqFt <- ocashInPocket / df$CostperSqFt
    
    dfSqFtBind <- df
    dfSqFtBind$reSF <- rSqFt
    
    dfSqF <- subset(dfSqFtBind, dfSqFtBind$Location == ocurrLocation)
    if(ocashInPocket <= 0) {
        print("You need to shell out money if you want the space")
    } else{
        paste0(round(dfSqF$reSF), " sq. feet")
    }
}

shinyServer(
    function(input, output) {
        output$odesiredSqFoot <- renderPrint({input$desiredSqFoot})
        output$ocashInPocket <- renderPrint({input$cashInPocket})
        output$ocurrLocation <- renderPrint({input$currLocation})
        output$pcurrLocation <- renderPrint({real_home_location(input$cashInPocket, 
                                                                input$desiredSqFoot)})
        output$pcashInPocket <- renderPrint({real_money(input$desiredSqFoot,
                                                           input$currLocation)})
        output$pdesiredSqFoot <- renderPrint({real_sq_ft(input$cashInPocket, 
                                                                input$currLocation)})
    }
)

