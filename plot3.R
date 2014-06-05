plot3 <- function() {
    
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
    
    ## Creates Plot 3
    png(filename = "plot3.png", width=480, height=480)
    
    plot(data$DateTime,
         data$Sub_metering_1,
         type = "l",
         ylab = "Energy sub metering",
         xlab = "")
    lines(data$DateTime, 
          data$Sub_metering_2, 
          col = "red")
    lines(data$DateTime, 
          data$Sub_metering_3, 
          col = "blue")
    legend("topright",
           lty = c(1,1,1),
           col = c("black","red","blue"),
           legend = names(data[,7:9]))
    
    dev.off()
    
    return(print("finished"))
}