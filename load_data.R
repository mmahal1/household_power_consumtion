library(data.table)
library(dplyr)
library(lubridate)

load_data <- function() {
  # Load data
  data <- fread("household_power_consumption.txt", na.strings = "?")
  
  # Filter for specific dates
  data <- data %>%
    mutate(Date = dmy(Date)) %>%
    filter(Date == "2007-02-01" | Date == "2007-02-02")
  
  # Combine Date and Time into DateTime
  data <- data %>%
    mutate(DateTime = as.POSIXct(paste(Date, Time)))
  
  return(data)
}

data <- load_data()
