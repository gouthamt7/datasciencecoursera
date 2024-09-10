#Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California 
# fips == "06037"). Which city has seen greater changes over time 
#in motor vehicle emissions?

# Load required libraries
library(ggplot2)

# Read the NEI and SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data for Baltimore City and Los Angeles County, and motor vehicle sources
vehicleData <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")

# Calculate total vehicle emissions for each year and city
totalVehicleEmissions <- aggregate(Emissions ~ year + fips, vehicleData, sum)

# Add city names
totalVehicleEmissions$city <- ifelse(totalVehicleEmissions$fips == "24510", "Baltimore City", "Los Angeles County")

# Create the plot
png("plot6.png", width=480, height=480)
ggplot(totalVehicleEmissions, aes(x=year, y=Emissions, color=city)) +
  geom_line() +
  geom_point() +
  xlab("Year") + 
  ylab("Total PM2.5 Emissions (tons)") +
  ggtitle("Motor Vehicle Emissions: Baltimore vs Los Angeles")
dev.off()