Plot4 <- function(){
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
  
  ## 4. Saving plots to PNG file
  png(file="./plot4.png",width=480, height=480)
  par(mfcol=c(2,2))
    ## first plot from plot2
  plot(HouseholdDataSub$Time,HouseholdDataSub$Global_active_power,type = "l",main = "",ylab = "Global active power", xlab = "")
   
    ## Second plot from plot3
  plot(HouseholdDataSub$Time,HouseholdDataSub$Sub_metering_1,type = "l",main = "",ylab = "Energy sub metering", xlab = "")
  lines(HouseholdDataSub$Time,HouseholdDataSub$Sub_metering_2, col="red")
  lines(HouseholdDataSub$Time,HouseholdDataSub$Sub_metering_3, col="blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lwd = 1, y.intersp = 1)
  
    ## Third plot Voltage over time
  plot(HouseholdDataSub$Time,HouseholdDataSub$Voltage, type = "l", main = "", ylab = "Voltage", xlab = "datetime")
 
    ## Fourth plot Global reactive power over time
  plot(HouseholdDataSub$Time,HouseholdDataSub$Global_reactive_power, type = "l", main = "", ylab = "Global_reactive_power", xlab = "datetime")
  dev.off()
}