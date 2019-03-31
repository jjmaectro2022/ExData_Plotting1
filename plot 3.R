data <- read.csv("household_power_consumption.txt", header = T, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = F)
data1 <- data
data1 <- dplyr::filter(data1, Date == "1/2/2007" | Date == "2/2/2007")
data1 <- dplyr::mutate(data1, datetime = paste(data1$Date, data1$Time))
data1$datetime <- strptime(data1$datetime, format = "%d/%m/%Y %H:%M:%S")

#Plot 3
plot(y = data1$Sub_metering_1, x = data1$datetime, col = "black", type = "l", xlab = "",  ylab = "Energy sub metering")
lines(y = data1$Sub_metering_2, x = data1$datetime, col = "red", type = "l")
lines(y = data1$Sub_metering_3, x = data1$datetime, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("black", "red", "blue"), y.intersp = 1,  cex = 1, x.intersp = 1, bty = "o")
dev.copy(png,'plot3.png')
dev.off()
