setwd('D:/r/exdata/project1')
data<-read.table('household_power_consumption.txt',
                 sep=";",
                 header=TRUE)
data$Date <- as.Date(strptime(data$Date,"%d/%m/%Y"))

data <- data[data$Date > as.Date("2007-01-31") &
           data$Date < as.Date("2007-02-03"),]