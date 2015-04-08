#load data file
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subset data from 1/2/2007 to 2/2/2007
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Get Date time in correct format
datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#get globalActivePower
globalActivePower <- as.numeric(sub$Global_active_power)
#subsets
subM1 <- as.numeric(sub$Sub_metering_1)
subM2 <- as.numeric(sub$Sub_metering_2)
subM3 <- as.numeric(sub$Sub_metering_3)

#Define PNG output and plot
png("plot3.png", width=480, height=480)
plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()