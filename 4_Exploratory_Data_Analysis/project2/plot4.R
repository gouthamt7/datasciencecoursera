#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999–2008?

# Read the NEI and SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Identify coal combustion related sources
coalSources <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
coalSCC <- SCC[coalSources, ]

# Subset NEI data for coal combustion sources
coalNEI <- NEI[NEI$SCC %in% coalSCC$SCC, ]

# Calculate total emissions from coal combustion for each year
totalCoalEmissions <- aggregate(Emissions ~ year, coalNEI, sum)

# Create the plot
png("plot4.png", width=480, height=480)
plot(totalCoalEmissions$year, totalCoalEmissions$Emissions/1000, type="b",
     xlab="Year", ylab="Total PM2.5 Emissions (kilotons)",
     main="Emissions from Coal Combustion-Related Sources")
dev.off()
