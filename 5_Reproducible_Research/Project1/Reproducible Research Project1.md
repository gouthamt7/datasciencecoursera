---
title: "Reproducible Research Project1"
output:  
   pdf_document: default
   keep_md: yes
---


```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown


## Loading and Preprocessing the Data
```{r, echo = TRUE}
# Load the data
activity <- read.csv("activity.csv")

# Process/transform the data
activity$date <- as.Date(activity$date)
```

## What is mean total number of steps taken per day?
```{r, echo = TRUE}
# Calculate average steps for each interval
avg_steps <- aggregate(steps ~ interval, activity, mean, na.rm = TRUE)

# Create time series plot
plot(avg_steps$interval, avg_steps$steps, type = "l", 
     main = "Average Daily Activity Pattern",
     xlab = "5-minute Interval", ylab = "Average Steps")

# Find interval with maximum steps
max_interval <- avg_steps$interval[which.max(avg_steps$steps)]
print(paste("Interval with maximum steps:", max_interval))
```

## Inputting Missing Values?
```{r, echo = TRUE}
# Calculate total missing values
total_missing <- sum(is.na(activity$steps))
print(paste("Total missing values:", total_missing))

# Strategy: Use mean for that 5-minute interval

# Create new dataset with imputed values
activity_imputed <- activity
for (i in 1:nrow(activity_imputed)) {
  if (is.na(activity_imputed$steps[i])) {
    activity_imputed$steps[i] <- avg_steps$steps[avg_steps$interval == activity_imputed$interval[i]]
  }
}

# Create histogram of imputed data
steps_per_day_imputed <- aggregate(steps ~ date, activity_imputed, sum)
hist(steps_per_day_imputed$steps, main = "Total Steps per Day (Imputed)", xlab = "Steps")

# Calculate new mean and median
mean_steps_imputed <- mean(steps_per_day_imputed$steps)
median_steps_imputed <- median(steps_per_day_imputed$steps)

print(paste("New mean steps per day:", round(mean_steps_imputed, 2)))
print(paste("New median steps per day:", round(median_steps_imputed, 2)))
```

## Are there differences in activity patterns between weekdays and weekends??
```{r, echo = TRUE}
# Create weekday/weekend factor
activity_imputed$day_type <- ifelse(weekdays(activity_imputed$date) %in% c("Saturday", "Sunday"), "weekend", "weekday")
activity_imputed$day_type <- as.factor(activity_imputed$day_type)

# Calculate average steps for each interval and day type
avg_steps_by_day <- aggregate(steps ~ interval + day_type, activity_imputed, mean)

# Create panel plot
library(ggplot2)
ggplot(avg_steps_by_day, aes(x = interval, y = steps, color = day_type)) +
  geom_line() +
  facet_wrap(~ day_type, ncol = 1, nrow = 2) +
  labs(title = "Average Steps by Interval and Day Type",
       x = "5-minute Interval", y = "Average Steps")
```
