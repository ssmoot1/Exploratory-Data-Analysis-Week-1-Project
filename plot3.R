setwd("~/Coursera/Plotting")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data <- transform(data, datetime=as.POSIXct(paste(Date, Time)))

##str(data)

with(data,
      {
        plot(Sub_metering_1~datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~datetime,col="Red")
        lines(Sub_metering_3~datetime,col="Blue")
      })
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png", width=600, height=480)
dev.off()
