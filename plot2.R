plot2 <- function()
{
  data <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,na.strings = "?", skip = 66637, nrows = 2880, colClasses = "character") 
  data$V1 <- strptime(paste(data[,1],data[,2]),format = "%d/%m/%Y %H:%M:%S")
  names(data) <- c("Date","Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "Sub_metering_1","Sub_metering_2", "Sub_metering_3")
  data$Global_active_power <- as.numeric(data$Global_active_power)  
  png(file = "plot2.png",width = 480, height = 480)
  Sys.setlocale("LC_TIME", "English") # because otherwise I get dutch tick marks
  with(data, plot(Date, Global_active_power, type = "n", xlab ="",ylab = "Global Active Power (kilowatts)"))
  lines(data$Date, data$Global_active_power)
  dev.off()  
}