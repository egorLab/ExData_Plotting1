data <- file("household_power_consumption.txt")

x <- read.table(text = grep("^[1,2]/2/2007", readLines(data), value = TRUE), 
                col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                sep = ";", header = TRUE)

datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale(category = "LC_ALL", locale = "english")
x$Datetime <- as.POSIXct(datetime)


plot(x$Global_active_power ~ x$Datetime, type = "l",
      ylab = "Global Active Power (kilowatts)", xlab = "")

dev.print(png, 'plot2.png', width=480, height=480)