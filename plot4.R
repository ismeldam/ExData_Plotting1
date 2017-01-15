library(data.table)
# Read file 
filepow <- fread("household_power_consumption.txt", na.strings = "?")

# created a new variable call DateTime
filepow$DateTime <- with(filepow, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Generated the subset file
date1 <- as.POSIXlt("2007-02-01 00:00:00")
date2 <- as.POSIXlt("2007-02-03 00:00:00")
subfile <- filepow[filepow$DateTime >= date1 & filepow$DateTime < date2,]

# create a png file
png("plot4.png")
par(mfrow = c(2,2))
plot(subfile$DateTime, subfile$Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l")
plot(subfile$DateTime, subfile$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(subfile$DateTime, subfile$Sub_metering_1, xlab = "", ylab = "", type = "l")
points(subfile$DateTime, subfile$Sub_metering_2, xlab = "", ylab = "", type = "l", col = "red")
points(subfile$DateTime, subfile$Sub_metering_3, xlab = "", ylab = "", type = "l", col = "blue")
title(ylab = "Energy Sub Metering")
legend("topright", lty = c(1,1), col = c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(subfile$DateTime, subfile$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()
