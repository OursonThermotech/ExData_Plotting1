Plot3 <- function(){
  ## 1. Download and extract data
  ##zip_file <- download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip', mode = 'wb')
  ##unzip(zipfile = "household_power_consumption.zip", exdir = ".")
  
  ## 2. Load data and format date columns
  HouseholdData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  HouseholdData$Time <- paste(HouseholdData$Date, HouseholdData$Time)
  HouseholdData$Date <- as.Date(HouseholdData$Date,format="%d/%m/%Y")
  
  ## 3. Subset to desired time frame and format time column
  HouseholdDataSub <- HouseholdData[HouseholdData$Date >= "2007-02-01" & HouseholdData$Date <= "2007-02-02",]
  HouseholdDataSub$Time <- strptime(HouseholdDataSub$Time, format = "%d/%m/%Y %H:%M:%S")
  
  ## 4. Saving plot to PNG file
  png(file="./plot3.png",width=480, height=480)
  plot(HouseholdDataSub$Time,HouseholdDataSub$Sub_metering_1,type = "l",main = "",ylab = "Energy sub metering", xlab = "")
  lines(HouseholdDataSub$Time,HouseholdDataSub$Sub_metering_2, col="red")
  lines(HouseholdDataSub$Time,HouseholdDataSub$Sub_metering_3, col="blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lwd = 1, y.intersp = 1)
  dev.off()
  
}