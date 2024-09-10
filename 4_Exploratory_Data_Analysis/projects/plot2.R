# Load required libraries
library(data.table)
library(lubridate)
library(ggplot2)

# Download and unzip the dataset if it doesn't exist
if (!file.exists("household_power_consumption.txt")) {
  fileURL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
  download.file(fileURL, destfile = "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}

# Read the data
data <- fread("household_power_consumption.txt", 
              na.strings = "?", 
              col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                            "Voltage", "Global_intensity", "Sub_metering_1", 
                            "Sub_metering_2", "Sub_metering_3"))

# Combine Date and Time, convert to POSIXct
data[, DateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Subset the data for the dates 2007-02-01 and 2007-02-02
data_subset <- data[DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03")]

# Plot 2: Global Active Power over time
png("plot2.png", width = 480, height = 480)
plot(data_subset$DateTime, data_subset$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

