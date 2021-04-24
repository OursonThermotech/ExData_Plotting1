Plot2 <- function(){
  ## 1. Download and extract data
  zip_file <- download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip', mode = 'wb')
  unzip(zipfile = "household_power_consumption.zip", exdir = ".")
  
  ## 2. Load data and format date columns
  HouseholdData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  HouseholdData$Time <- paste(HouseholdData$Date, HouseholdData$Time)
  HouseholdData$Date <- as.Date(HouseholdData$Date,format="%d/%m/%Y")
  
  ## 3. Subset to desired time frame and format time column
  HouseholdDataSub <- HouseholdData[HouseholdData$Date >= "2007-02-01" & HouseholdData$Date <= "2007-02-02",]
  HouseholdDataSub$Time <- strptime(HouseholdDataSub$Time, format = "%d/%m/%Y %H:%M:%S")
  
  
  ## 4. Saving plot to PNG file
  png(file="./plot2.png",width=480, height=480)
  plot(HouseholdDataSub$Time,HouseholdDataSub$Global_active_power,type = "l",main = "",ylab = "Global active power (kilowatts)", xlab = "")
  dev.off()
  
}