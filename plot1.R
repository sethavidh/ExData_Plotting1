# plot1.R
#  Read only 2-day period of data and plot a histogram of global active power to png file

library(lubridate)

data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880,na.strings = "?")
table_header <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1)
names(data) <- names(table_header)

data$Date <- dmy_hms(paste(data$Date, data$Time))
data$Time <- NULL

png("plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()