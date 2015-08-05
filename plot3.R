# plot3.R
#  Read only 2-day period of data and plot a line graph of sub-metering power by time to png file

library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880,na.strings = "?")
table_header <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1)
names(data) <- names(table_header)

data$Date <- dmy_hms(paste(data$Date, data$Time))
data$Time <- NULL

png("plot3.png")
plot(data$Date, data$Sub_metering_1 ,type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Date, data$Sub_metering_2, type = "l", col = "red")
lines(data$Date, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty= c(1,1,1), col = c("black", "red", "blue"), legend = c(names(data)[6:8]))
dev.off()