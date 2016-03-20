data <- file("household_power_consumption.txt")

x <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE), 
col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
sep = ";", header = TRUE)

hist(x$Global_active_power,xlab = "Global active power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red", breaks = 25)

dev.print(png, 'plot1.png', width=480, height=480)