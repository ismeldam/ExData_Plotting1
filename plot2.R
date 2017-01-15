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
png("plot2.png")
plot(subfile$DateTime, subfile$Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l")
dev.off()
