library (ggplot2)
library (plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- as.factor(NEI$year)
NEI$type <- as.factor(NEI$type)

cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

png(filename = "Rplot1.png", width = 480, height = 480, pointsize = 12, bg = "white")
forplot <- ddply(NEI, .(year), summarize, total.emission = sum(Emissions))
#barplot(total_emission, xlab = "Year",  col = unique(NEI$year),ylab= "PM2.5 Emissions", main = "Total Emission PM25 for each Year")
plot1 <- ggplot(data = forplot, aes(x = year, y = total.emission, fill=year)) + geom_bar(stat = "identity") +  labs(x="Year", y="PM2.5 Emissions") + labs(title="Total PM2.5 Emission for each Year")
plot1 <- plot1 + scale_fill_manual(values=cbPalette) 

print(plot1 + scale_fill_manual(values=cbPalette))
dev.off()