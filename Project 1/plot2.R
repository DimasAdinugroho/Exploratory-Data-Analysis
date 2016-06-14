file <- "household_power_consumption.txt"
PowerData <- read.table(file, sep=";" , header=TRUE)
PowerData$RealDate <- as.Date(PowerData$Date,format='%d/%m/%Y')

newData <- PowerData[which(PowerData$RealDate == "2007-02-01" | PowerData$RealDate == "2007-02-02"),]
newData$RealDate <- strptime(paste(newData$Date, newData$Time),"%d/%m/%Y %H:%M:%S")

png(file = "plot2.png", bg = "transparent", width = 480, height = 480)
#Plot
plot(newData$RealDate, as.numeric(as.character(newData$Global_active_power)),type = "l", ylab="Global Active Power (Kilowatts)" ,xlab = "")

dev.off()
