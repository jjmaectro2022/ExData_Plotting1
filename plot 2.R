data <- read.csv("household_power_consumption.txt", header = T, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = F)
data1 <- data
data1 <- dplyr::filter(data1, Date == "1/2/2007" | Date == "2/2/2007")
data1 <- dplyr::mutate(data1, datetime = paste(data1$Date, data1$Time))
data1$datetime <- strptime(data1$datetime, format = "%d/%m/%Y %H:%M:%S")

#Plot 2 
plot(y = data1$Global_active_power, x = data1$datetime, type = "l", xlab = "",  ylab = "Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()
