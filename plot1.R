plot1 <- function() {
    
    ## Reads data from working directory and subsets to dates
    ## selected 2007-02-01 and 2007-02-02
    data<-read.table('household_power_consumption.txt',
                     sep=";",
                     header=TRUE,
                     na.strings = "?",
                     stringsAsFactors=TRUE)
    
    data$Date <- as.Date(strptime(data$Date,"%d/%m/%Y"))
    
    data <- data[data$Date > as.Date("2007-01-31") &
                     data$Date < as.Date("2007-02-03"),]
    
    ## Creates Plot 1 Histogram
    png(filename = "plot1.png", width=480, height=480)
    hist(data$Global_active_power, 
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power",
         col = "red")
    dev.off()
    return(print("finished"))

}