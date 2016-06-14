file <- "household_power_consumption.txt"
PowerData <- read.table(file, sep=";" , header=TRUE)
PowerData$RealDate <- as.Date(PowerData$Date,format='%d/%m/%Y')

newData <- PowerData[which(PowerData$RealDate == "2007-02-01" | PowerData$RealDate == "2007-02-02"),]

png(file = "plo1.png", bg = "transparent", width = 480, height = 480)
hist(as.integer(newData$Global_active_power)/1000, col = 'red', breaks = 11, xlab="Global Active Power (Kilowatts)", ylab= "Frequency", main ="Global Active Power",yaxt='n')
axis(side=2, at=seq(0, 1200, by=200))

dev.off()
