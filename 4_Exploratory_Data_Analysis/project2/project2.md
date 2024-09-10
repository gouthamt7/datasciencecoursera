# Exploratory Data Analysis Project 2 (JHU) Coursera

Unzipping and Loading Files into the current directory
----------
```R
library("data.table")
path <- getwd()
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = paste(path, "dataFiles.zip", sep = "/"))
unzip(zipfile = "dataFiles.zip")

# Read the NEI and SCC data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
```

Question 1 ([plot1.R](https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot1.R))
----------
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

```R
# Calculate total emissions for each year
totalEmissions <- aggregate(Emissions ~ year, NEI, sum)

# Create the plot
png("plot1.png", width=480, height=480)
plot(totalEmissions$year, totalEmissions$Emissions/1000, type="b", 
     xlab="Year", ylab="Total PM2.5 Emissions (kilotons)", 
     main="Total PM2.5 Emissions in the US")
dev.off()
```

<img src="https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot1.png" alt="Exploratory Data Analysis Project 2 question 1" >

Question 2 ([plot2.R](https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot2.R))
----------
Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

```R

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
```
<img src="https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot2.png" alt="Exploratory Data Analysis Project 2 question 2" >

Question 3 ([plot3.R](https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot3.R))
----------
Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

```R
library(ggplot2)

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
```

<img src="https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot3.png" alt="Exploratory Data Analysis Project 2 question 3" >

Question 4 ([plot4.R](https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot4.R))
----------
Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

```R

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

```

<img src="https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot4.png" alt="Exploratory Data Analysis Project 2 question 4" >

Question 5 ([plot5.R](https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot5.R))
----------
How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

```R
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
```

<img src="https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot5.png" alt="Exploratory Data Analysis Project 2 question 5" >

Question 6 ([plot6.R](https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot6.R))
----------
Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

```R
library(ggplot2)

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
```

<img src="https://github.com/gouthamt7/datasciencecoursera/blob/Master/4_Exploratory_Data_Analysis/project2/plot6.png" alt="Exploratory Data Analysis Project 2 question 6" >