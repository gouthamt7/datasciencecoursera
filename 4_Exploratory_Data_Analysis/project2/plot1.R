#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission 
#from all sources for each of the years 1999, 2002, 2005, and 2008.

# Read the NEI data
NEI <- readRDS("summarySCC_PM25.rds")

# Calculate total emissions for each year
totalEmissions <- aggregate(Emissions ~ year, NEI, sum)

# Create the plot
png("plot1.png", width=480, height=480)
plot(totalEmissions$year, totalEmissions$Emissions/1000, type="b", 
     xlab="Year", ylab="Total PM2.5 Emissions (kilotons)", 
     main="Total PM2.5 Emissions in the US")
dev.off()
