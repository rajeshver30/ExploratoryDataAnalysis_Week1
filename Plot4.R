## Objective of this function is to 
## 1. read the household_power_consumption.txt file
## 2. subset data for 2 dates 2007-02-01 and 2007-02-02
## 3. generate multiple plots (4 nos.) as mentioned below with proper spacing in row/column format 
##    Plot#1: Global Active Power vs Time, 
##    Plot#2: Energy Sub metering vs Time, 
##    Plot#3: Voltage vs Datetime
##    Plot#4: Global Reactive Power vs Datetime


## set the working directory
## setwd("D:/Coursera/R Programming/Quiz1_EDA")
Powerdata <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors=F, col.names = c("Date","Time", "Global_Active_Power", "Global_Reactive_Power", "Voltage", "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

## subset data from 2007-02-01 and 2007-02-02
Powerdata1 <- subset(Powerdata, Date %in% c("1/2/2007","2/2/2007"))

Powerdata1$date <- as.Date(Powerdata1$Date, format="%d/%m/%Y")
Datetime <- strptime(paste(Powerdata1$Date, Powerdata1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)

## Plot multiple graphs (4 nos.)
par(mfcol=c(2,2))
with (Powerdata1, { 
  plot(Datetime, Global_Active_Power, type="l", xlab="", ylab="Global Active Power")
  plot(Datetime, Sub_Metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Datetime, Sub_Metering_2, type="l", col="red")
  lines(Datetime, Sub_Metering_3, type="l", col="blue")
  #  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, cex=0.5,  col = c("black", "red", "blue"))
  plot(Datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(Datetime, Global_Reactive_Power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()