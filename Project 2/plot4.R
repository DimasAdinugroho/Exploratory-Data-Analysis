library(ggplot2)
library (plyr)

NEI$type <- as.factor(NEI$type)
NEI$year <- as.factor(NEI$year)
SCC.subs <- SCC[grep("[cC]oal", SCC$Short.Name),]
NEI.sub <- NEI[NEI$SCC %in% SCC.subs$SCC, ] #mereturn table NEI yang NEI$CSS sama di SCC.subs$SCC
png(filename = "Rplot4.png", width = 480, height = 480, pointsize = 12, bg = "white")
plot4 <- ggplot(NEI.sub, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)
dev.off()
