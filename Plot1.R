#LOADING DATA
full.data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#converting classes
full.data$Dates <- as.Date(full.data$Date,"%d/%m/%Y")
full.data$Date.Time <- paste(full.data$Dates, full.data$Time, sep = " ")
full.data$Times <- strptime(full.data$Date.Time, format = "%Y-%m-%d %H:%M:%S")

#subsetting necessary data
power.consumption <- full.data[which(full.data$Dates >= "2007-02-01" & full.data$Dates <= "2007-02-02"),]


#MAKING PLOTS

#Plot 1
png("plot1.png", width = 480, height = 480)
hist(power.consumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()