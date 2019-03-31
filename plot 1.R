data <- read.csv("household_power_consumption.txt", header = T, sep = ";", dec = ".", na.strings = "?")
data1 <- data
data1$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- dplyr::filter(data1, (Date >= "2007-02-01") & (Date <= "2007-02-02"))

#Plot 1 
hist(data1$Global_active_power, col = "green", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()