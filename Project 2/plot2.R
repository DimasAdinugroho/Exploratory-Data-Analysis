library (ggplot2)
library (plyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#chart biasa
#baltsub <- subset(NEI, fips == "24510")
#total_emission <- tapply(baltsub$Emissions,baltsub$year,sum)
#plot(names(total_emission), total_emission, xlab = "Year",ylab= "Total Emission", main = "Total Emission in Baltimore City for each Year", type = "l", col = "red")

#dengan ggplot
png(filename = "Rplot2.png", width = 480, height = 480, pointsize = 12, bg = "white")
forplot <- ddply(NEI, .(year, fips), summarize, total.emission = sum(Emissions))
balplot <- forplot[forplot$fips == '24510',]
plot2 <- ggplot(data = balplot, aes(x = year, y = total.emission, fill=year)) + geom_bar(stat = "identity") +  labs(x="Year", y="PM2.5 Emissions") + labs(title="Total PM2.5 Emissions in Baltimore County") 
print(plot2)
dev.off()