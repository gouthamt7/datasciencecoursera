## Getting_and_Cleaning_Data Project- Samsung Galaxy S Smartphone Accelerometer Data Analysis
Goutham Tanjavuru <br />
## Goal of the project 
This project analyzes data collected from the accelerometers of the Samsung Galaxy S smartphone. 
The goal is to prepare:
1. A tidy data set that can be used for later analysis.
2. A link to a Github repository with your script for performing the analysis 
3. A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
4. Analysis R Script

## Review Criteria

Goal | Item | Link to Item
--- | --- | ---
Analysis R Script |  run_analysis.R |  [R Script Link](https://github.com/gouthamt7/datasciencecoursera/blob/Master/3_Getting_and_Cleaning_Data/projects/run_analysis.R "run_analysis.R")
Tidy Data Set |  Clean Data Set |  [Data Set Link](https://github.com/gouthamt7/datasciencecoursera/blob/Master/3_Getting_and_Cleaning_Data/data/tidy_data.txt "tidyData.txt")
Github Repo | Repo |  [Repo Link](https://github.com/gouthamt7/datasciencecoursera/tree/Master/3_Getting_and_Cleaning_Data) "Click to go to Repo")
Codebook | CodeBook.md |  [CodeBook Link](https://github.com/gouthamt7/datasciencecoursera/blob/Master/3_Getting_and_Cleaning_Data/projects/CodeBook.md "CodeBook.md")
README | ReadingItNow |  [ReadMe Link](https://github.com/gouthamt7/datasciencecoursera/blob/Master/3_Getting_and_Cleaning_Data/projects/README.md "README.md")

## Script: run_analysis.R

The `run_analysis.R` script performs the following steps:

1. **Download and unzip the data**
   - Checks if the data directory exists
   - If not, downloads and unzips the data
  
2. **Read in the data files**
   - Loads features and activity labels
   - Reads training and test data sets

3. **Merge the training and test sets**
   - Combines X, Y, and subject data for both training and test sets

4. **Extract mean and standard deviation measurements**
   - Selects only the measurements on mean and standard deviation

5. **Use descriptive activity names**
   - Replaces activity codes with descriptive names

6. **Label the data set with descriptive variable names**
   - Cleans up variable names to be more descriptive

7. **Create a tidy data set with averages**
   - Groups the data by subject and activity
   - Calculates the average of each variable for each activity and subject
   -  To ensure your submitted data set is tidy, you should check that it  
   -  follows these key principles of tidy data:
   -  a)Each variable forms a column
   -  b)Each observation forms a row
   -  c)Each type of observational unit forms a table

8. **Write the tidy data to a file**
   - Outputs the final tidy data set to "tidy_data.txt"

9. **How to use the script**
   
   1. Ensure we have R installed on our system.
   2. Set your working directory to the location of the script.
   3. Run the script in R or RStudio: source("run_analysis.R")



