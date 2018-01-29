## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")

# Extract baltimore sources
emiBatltimore<-NEI[NEI$fips=="24510",]

# aggregate value emission per year and sum it
EmiTotperYear<-aggregate(Emissions~year,emiBatltimore,sum)

# reduce the value of emissions for more visibility
EmissionsTot <- EmiTotperYear$Emissions

#Open device 
# png 480 px x 480 px (as the previous assignement)
png(filename = "plot2.png", width = 480, height = 480, units = 'px' )

# plot a bar graph
barplot(EmissionsTot,
        names.arg=EmiTotperYear$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions From Baltimore Sources")

# close device
dev.off()