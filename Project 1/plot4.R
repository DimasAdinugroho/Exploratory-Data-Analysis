file <- "household_power_consumption.txt"
PowerData <- read.table(file, sep=";" , header=TRUE)
PowerData$RealDate <- as.Date(PowerData$Date,format='%d/%m/%Y')

newData <- PowerData[which(PowerData$RealDate == "2007-02-01" | PowerData$RealDate == "2007-02-02"),]
newData$RealDate <- strptime(paste(newData$Date, newData$Time),"%d/%m/%Y %H:%M:%S")

png(file = "plot4.png", bg = "transparent", width = 480, height = 480)

par(mfrow = c(2,2),  mar = c(4,4,2,1))
#plot1 (top-left)
plot(newData$RealDate, as.numeric(as.character(newData$Global_active_power)),type = "l", ylab="Global Active Power (Kilowatts)" ,xlab = "")

#plot2 (top-right)
plot(newData$RealDate, as.numeric(as.character(newData$Voltage)),type = "l", ylab="Voltage" ,xlab = "datetime")

#plot3 (bottom-left)
plot(newData$RealDate,as.numeric(as.character(newData$Sub_metering_1)) ,type = "l", ylab="Energy Sub metering" ,xlab = "")
lines(newData$RealDate, as.numeric(as.character(newData$Sub_metering_2)), type="l", col="red")
lines(newData$RealDate, as.numeric(as.character(newData$Sub_metering_3)), type="l", col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, col = c("black","red","blue"))

#plot3 (bottom-right)
plot(newData$RealDate, as.numeric(as.character(newData$Global_reactive_power)),type = "l", ylab="global_reactive_power" ,xlab = "datetime")

dev.off()
