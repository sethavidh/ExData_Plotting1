# plot2.R
#  Read only 2-day period of data and plot a line graph of global active power by time to png file

library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880,na.strings = "?")
table_header <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1)
names(data) <- names(table_header)

data$Date <- dmy_hms(paste(data$Date, data$Time))
data$Time <- NULL

png("plot2.png")
plot(data$Date, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()