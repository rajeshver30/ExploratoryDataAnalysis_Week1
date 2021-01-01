## Objective of this function is to 
## 1. read the household_power_consumption.txt file
## 2. subset data for 2 dates 2007-02-01 and 2007-02-02
## 3. generate a plot of different Energy sub meterings vs time

## set the working directory
## setwd("D:/Coursera/R Programming/Quiz1_EDA")

## Assuming the household_power_consumption.txt file is located in working dir
## read data from text file
Powerdata <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors=F, col.names = c("Date","Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

## subset data from 2007-02-01 and 2007-02-02
Powerdata1 <- subset(Powerdata, Date %in% c("1/2/2007","2/2/2007"))
Powerdata1$date <- as.Date(Powerdata1$Date, format="%d/%m/%Y")
png("plot3.png", width=480, height=480)

## plot of Energy sub meterings vs date-time for specified 2 days period in February, 2007
with(Powerdata1, {
  plot(Datetime, Sub_Metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Datetime, Sub_Metering_2, type="l", col="red")
  lines(Datetime, Sub_Metering_3, type="l", col="blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
})
dev.off()