
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 
SCC_COAL<-SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]
NEI_COAL<-NEI[NEI$SCC %in% SCC_COAL,]

# plot a line graph
g<-ggplot(NEI_COAL,aes(year,Emissions/10^5))
g + geom_line(stat ="summary",fun.y="sum") + labs(
  x="Year", y=expression("PM2.5 Emission (10^5 Tons)"),
  title=expression("Coal Combustion Source Emissions Across US from 1999-2008") )

# close device
ggsave("plot4.png")