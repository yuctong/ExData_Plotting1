plot2 <- function() {
    
    ## Reads data from working directory and subsets to dates
    ## selected 2007-02-01 and 2007-02-02
    data<-read.table('household_power_consumption.txt',
                     sep=";",
                     header=TRUE,
                     na.strings = "?",
                     stringsAsFactors=TRUE)
    
    data$Date <- as.Date(strptime(data$Date,"%d/%m/%Y"))
    # Subsetting
    data <- data[data$Date > as.Date("2007-01-31") &
                     data$Date < as.Date("2007-02-03"),]
    # DateTime Creation    
    data$DateTime <- paste(data$Date, data$Time)
    data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
    
    ## Creates Plot 2 Line
    png(filename = "plot2.png", width=480, height=480)
    plot(data$DateTime,
         data$Global_active_power,
         type = "l",
         ylab = "Global Active Power (kilowatts)",
         xlab = "")
    dev.off()
    return(print("finished"))
}