#load data file
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subset data from 1/2/2007 to 2/2/2007
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Get Date time in correct format
datetime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#get globalActivePower
globalActivePower <- as.numeric(sub$Global_active_power)
#Define PNG output and plot
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()