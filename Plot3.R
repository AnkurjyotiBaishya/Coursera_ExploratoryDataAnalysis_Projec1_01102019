#LOADING DATA
full.data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#converting classes
full.data$Dates <- as.Date(full.data$Date,"%d/%m/%Y")
full.data$Date.Time <- paste(full.data$Dates, full.data$Time, sep = " ")
full.data$Times <- strptime(full.data$Date.Time, format = "%Y-%m-%d %H:%M:%S")

#subsetting necessary data
power.consumption <- full.data[which(full.data$Dates >= "2007-02-01" & full.data$Dates <= "2007-02-02"),]
power.consumption$Weekdays <- weekdays(power.consumption$Dates)


#MAKING PLOTS

#Plot 3
png("plot3.png", width = 480, height = 480)
plot(x = power.consumption$Times, y = power.consumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = power.consumption$Times, y = power.consumption$Sub_metering_2, col = "red")
lines(x = power.consumption$Times, y = power.consumption$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()