library(ggplot2)
library (plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)
baltsub <- subset(NEI, fips == "24510")

forplot <- ddply(baltsub, .(year, type), summarize, total.emission = sum(Emissions))
ggplot(data=forplot, aes(x=year, y=total.emission, group=type, colour=type)) +
  geom_line() +
  geom_point() +  labs(x="Year", y="PM2.5 Emissions") + labs(title="Total PM2.5 Emissions in Baltimore County by Type")

png(filename = "Rplot3.png", width = 480, height = 480, pointsize = 12, bg = "white")