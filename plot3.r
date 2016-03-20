data <- file("household_power_consumption.txt")

x <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE), 
                col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                sep = ";", header = TRUE)


Sys.setlocale(category = "LC_ALL", locale = "english")
datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
x$Datetime <- as.POSIXct(datetime)

plot(x$Sub_metering_1 ~ x$Datetime, type = "l",ylab = "Energy Sub Metering", xlab = "")
lines(x$Sub_metering_2~ x$Datetime, col = "red")
lines(x$Sub_metering_3~ x$Datetime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.print(png, 'plot3.png', width=480, height=480)


