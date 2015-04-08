#load data file
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subset data from 1/2/2007 to 2/2/2007
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Get Date time in correct format
datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#get globalActivePower
globalActivePower <- as.numeric(sub$Global_active_power)
#get reactive power
globalReactivePower <- as.numeric(sub$Global_reactive_power)
#get Voltage
voltage <- as.numeric(sub$Voltage)

#subsets
subM1 <- as.numeric(sub$Sub_metering_1)
subM2 <- as.numeric(sub$Sub_metering_2)
subM3 <- as.numeric(sub$Sub_metering_3)

#Define PNG output and plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#left up
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#right up
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#left down
plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#right down
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()