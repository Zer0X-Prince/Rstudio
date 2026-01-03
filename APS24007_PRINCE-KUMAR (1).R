# STATISTICS WITH R ASSIGNMENT
# AUTHOR DETAILS
# NAME = PRINCE KUMAR
# ROLL NO. = APS24007


# EXTRACT DATA FROM PUBLIC DATASET 
# IN HERE WE HAVE USED WDI WHICH USED FOR DOWNLOADING WORLD BANK DATA
if(!require(WDI)) install.packages("WDI") 
if(!require(dplyr)) install.packages("dplyr")
if(!require(ggplot2)) install.packages("ggplot2")

library(WDI) # FOR DOWNLOADING WORLD BANK DATA 
library(dplyr)  # FOR RENAMING AND CLEANING
library(ggplot2)  # FOR MAKING GRAPH

print("Extracting Internet Usage Data from World Bank...")

indicator_code <- "IT.NET.USER.ZS"
countries <- c("IN", "CN", "GB")   # India, China, UK
start_year <- 2000
end_year   <- 2015

# Extract data
raw_data <- WDI(country = countries,
                indicator = indicator_code,
                start = start_year,
                end = end_year,
                extra = FALSE)

# Clean + rename column names
internet_data <- raw_data %>%
  rename(
    Internet_Usage_Pct = IT.NET.USER.ZS,
    Country = country,
    Year = year
  )
head(internet_data)


# EXTRACTING DATA FROM INBUILT DATASET mtcars
MT_CARS <- mtcars
head(MT_CARS)
head(MT_CARS, 3)
tail(MT_CARS)
summary(mtcars)

# Clean + rename column names
MT_CARsNEW <- MT_CARS %>%
 rename(
  DISPLACEMENT = disp,            ,
  GEAR = gear
)
head(MT_CARsNEW)
head(MT_CARsNEW, 4)
tail(MT_CARsNEW)
summary(MT_CARsNEW)





save(MT_CARS, file = "mtcars.RData")
load("mtcars.RData")


#SAVING AND EXPORTING EXTRACTED DATA
# Save as CSV
write.csv(internet_data, "internet_data_saved.csv", row.names = FALSE)
internet_data <- read.csv("internet_data_saved.csv")

# Save as RData
save(internet_data, file = "internet_data.RData")
load("internet_data.RData")
data1 <- read.csv("internet_data_saved.csv",
                 header = TRUE,
                 sep = ",")




# RANDOM VARIABLES
population <- c(140, 120, 60, 30)
countries <- c("India", "China", "USA", "Russia")
colours <- c("Red", "Blue", "Green", "Yellow")
x <- c(98, 54, 36, 86, 54, 69, 99)
y <- c("Bheem", "Raju", "Jaggu", "Chutki", "Dholu", "Bholu", "Indumati")
z <- c(11, 56, 36, 88, 54, 54, 47)


# DATA SUMMARIZATION
mean(x)      # Mean
median(x)    # Median
sd(x)        # Standard Deviation
mode(x)      # mode
names(sort(table(x), decreasing = TRUE))[1] # Simple Methos of getting mode


# GRAPHICAL REPRESENTAION USING PIE CHART
pie(x, labels = y, main = "Performance of Dholakpur")
pie(population, labels = countries, col = colours, main = "Population Share")

# GRAPHICAL REPRESENTAION USING BAR PLOT
barplot(population, col = colours, names.arg = countries, main = "Population Share", xlab = "Country Name",
        ylab = "Population(in cr)")

# GRAPHICAL REPRESENTAION USING HISTOGRAM
hist(x, col = colours, border = "black", xlab = "Values",
     ylab = "Frequency")

# GRAPHICAL REPRESENTAION USING SCATTER PLOT
plot(x, z,
     main = "Simple Scatter Plot",
     xlab = "X Values",
     ylab = "Y Values")

#just test
