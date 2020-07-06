#Reading data

File <- file("household_power_consumption.txt")
colNames <- unlist(read.table("household_power_consumption.txt", nrows = 1, sep = ";"))
data <- read.table(text = grep("^[1,2]/2/2007", readLines(File), value = TRUE), col.names = colNames, sep = ";", header = TRUE)

#Plot 1
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

#Plot 2
data$time <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %T")
plot(data$time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot 3
with(data, plot(time, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
with(data, lines(time, Sub_metering_2, col = "red"))
with(data, lines(time, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)

