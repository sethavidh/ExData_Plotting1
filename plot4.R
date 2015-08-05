# plot4.R
#  Read only 2-day period of data and plot 4 graphs

library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880,na.strings = "?")
table_header <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1)
names(data) <- names(table_header)

data$Date <- dmy_hms(paste(data$Date, data$Time))
data$Time <- NULL

png("plot4.png")
par(mfcol = c(2,2))
#graph 1
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
#graph 2
plot(data$Date, data$Sub_metering_1 ,type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2, type = "l", col = "red")
lines(data$Date, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty= c(1,1,1), col = c("black", "red", "blue"), legend = c(names(data)[6:8]), bty = "n")
#graph 3
plot(data$Date, data$Voltage ,type = "l", xlab = "datetime", ylab = "Voltage")
#graph 4
plot(data$Date, data$Global_reactive_power ,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()