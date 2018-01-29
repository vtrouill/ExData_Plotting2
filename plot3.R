## library tidyverse
library(ggplot2) 

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")

# Extract baltimore sources
emiBatltimore<-NEI[NEI$fips=="24510",]

# aggregate value emission per year and sum it
EmiTotperYear<-aggregate(Emissions~year,emiBatltimore,sum)

# plot a bar graph
g<-ggplot(NEI_COAL,aes(year,Emissions/10^5))
g + geom_line(stat ="summary",fun.y="sum") + labs(x="Year", y=expression("PM2.5 Emission (10^5 Tons)"),title=expression("Coal Combustion Source Emissions Across US from 1999-2008") )

#save the last plot
ggsave("plot4.png")
