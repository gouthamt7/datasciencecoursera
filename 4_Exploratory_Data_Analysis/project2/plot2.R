#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (
#  fips == "24510" ) from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

# Read the NEI data
NEI <- readRDS("summarySCC_PM25.rds")

# Subset data for Baltimore City
baltimoreData <- subset(NEI, fips == "24510")

# Calculate total emissions for each year in Baltimore
totalEmissions <- aggregate(Emissions ~ year, baltimoreData, sum)

# Create the plot
png("plot2.png", width=480, height=480)
plot(totalEmissions$year, totalEmissions$Emissions, type="b", 
     xlab="Year", ylab="Total PM2.5 Emissions (tons)", 
     main="Total PM2.5 Emissions in Baltimore City")
dev.off()
