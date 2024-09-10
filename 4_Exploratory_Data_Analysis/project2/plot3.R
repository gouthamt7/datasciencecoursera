# Of the four types of sources indicated by the types: point, nonpoint, onroad, nonroad 
#variable, which of these four sources have seen decreases in emissions 
#from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

# Load required libraries
library(ggplot2)

# Read the NEI data
NEI <- readRDS("summarySCC_PM25.rds")

# Subset data for Baltimore City
baltimoreData <- subset(NEI, fips == "24510")

# Calculate emissions by type and year
emissionsByType <- aggregate(Emissions ~ year + type, baltimoreData, sum)

# Create the plot
png("plot3.png", width=480, height=480)
ggplot(emissionsByType, aes(x=year, y=Emissions, color=type)) +
  geom_line() +
  geom_point() +
  xlab("Year") + 
  ylab("Total PM2.5 Emissions (tons)") +
  ggtitle("PM2.5 Emissions by Source Type in Baltimore City")
dev.off()
