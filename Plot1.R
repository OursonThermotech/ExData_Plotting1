Plot1 <- function(){
  ## 1. Download and extract data
  zip_file <- download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip', mode = 'wb')
  unzip(zipfile = "household_power_consumption.zip", exdir = ".")
  
  ## 2. Load data and format date columns
  HouseholdData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  HouseholdData$Date <- as.Date(HouseholdData$Date,format="%d/%m/%Y")
  
  ## 3. Subset to desired time frame
  HouseholdDataSub <- HouseholdData[HouseholdData$Date >= "2007-02-01" & HouseholdData$Date <= "2007-02-02",]
  
  ## 4. Saving Histogram plot to PNG file
  png(file="./plot1.png",width=480, height=480)
  hist(as.numeric(HouseholdDataSub$Global_active_power),col = "red", xlab= "Global active power (kilowatts)", main = "Global active power")
  dev.off()
  
}