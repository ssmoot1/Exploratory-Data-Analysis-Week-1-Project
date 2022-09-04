setwd("~/Coursera/Plotting")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data <- transform(data, datetime=as.POSIXct(paste(Date, Time)))

##str(data)

par(mfrow=c(2,2), mar=c(4,4,2,1))
with(data, 
     {
      plot(Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)")
      plot(Voltage~datetime, type="l", ylab="Voltage (volt)")
      plot(Sub_metering_1~datetime, type="l",ylab="Global Active Power (kilowatts)")
      lines(Sub_metering_2~datetime,col='Red')
      lines(Sub_metering_3~datetime,col='Blue')
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      plot(Global_reactive_power~datetime, type="l",ylab="Global Reactive Power (kilowatts)")
      }
     )
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
