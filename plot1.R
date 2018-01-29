## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate value emission per year and sum it
EmiTotperYear<-aggregate(Emissions~year,NEI,sum)

# reduce the value of emissions for more visibility
EmissionsTot <- EmiTotperYear$Emissions/10^6

#Open device 
# png 480 px x 480 px (as the previous assignement)
png(filename = "plot1.png", width = 480, height = 480, units = 'px' )

# plot a bar graph
barplot(EmissionsTot,
             names.arg=EmiTotperYear$year,
             xlab="Year",
             ylab="PM2.5 Emissions (Tons)",
             main="Total PM2.5 Emissions From All US Sources")

# close device
dev.off()
