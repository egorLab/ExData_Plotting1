data <- file("household_power_consumption.txt")

x <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE), 
                col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                sep = ";", header = TRUE)

Sys.setlocale(category = "LC_ALL", locale = "english")
datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
x$Datetime <- as.POSIXct(datetime)


par(mfrow=c(2,2),mar = c(2,4,2,1))
#first
plot(x$Global_active_power ~ x$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
#second
plot(x$Datetime, x$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
#third
plot(x$Datetime, x$Sub_metering_1 , type = "l",ylab = "Energy Sub Metering", xlab = "")
lines(x$Datetime, x$Sub_metering_2,  col = "red")
lines(x$Datetime, x$Sub_metering_3,  col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, cex = 0.5, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#fourth
plot(x$Datetime, x$Global_reactive_power,type = "n", xlab="datetime", ylab="Global reactivevpower")
lines(x$Datetime, x$Global_reactive_power)

dev.print(png, 'plot4.png', width=480, height=480)
