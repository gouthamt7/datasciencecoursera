#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Read the NEI and SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data for Baltimore City and motor vehicle sources
baltimoreVehicles <- subset(NEI, fips == "24510" & type == "ON-ROAD")

# Calculate total vehicle emissions for each year in Baltimore
totalVehicleEmissions <- aggregate(Emissions ~ year, baltimoreVehicles, sum)

# Create the plot
png("plot5.png", width=480, height=480)
plot(totalVehicleEmissions$year, totalVehicleEmissions$Emissions, type="b",
     xlab="Year", ylab="Total PM2.5 Emissions (tons)",
     main="Motor Vehicle Emissions in Baltimore City")
dev.off()
