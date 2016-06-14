library(ggplot2)
library(plyr)

NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)

NEI.sub <- subset(NEI, (fips == "24510" | fips == "06037")  & type == "ON-ROAD")
forplot <- ddply(NEI.sub, .(year, fips), summarize, total.emission = sum(Emissions))

png(filename = "Rplot5.png", width = 480, height = 480, pointsize = 12, bg = "white")
plot5 <-ggplot(data=forplot, aes(x=factor(year), y=total.emission, group=fips, colour=fips)) +
  geom_line() +
  geom_point() +  labs(x="Year", y="PM2.5 Emissions") + labs(title="Total PM2.5 Emissions type 'ON-ROAD' in Baltimore Vs California")
print(plot5)
dev.off()
