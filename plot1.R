#load data file
file <- "./household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subset data from 1/2/2007 to 2/2/2007
sub <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#get globalActivePower
globalActivePower <- as.numeric(sub$Global_active_power)
#Define PNG output and plot histogram
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()