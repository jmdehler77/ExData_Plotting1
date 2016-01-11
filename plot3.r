# Load the data from the local flat file
data <- read.table("household_power_consumption.txt", header=T, sep=";")

# Format the date values properly
data$Date2 <- as.Date(data$Date, "%d/%m/%Y")

# Subset the data by date
data2 <-subset(data, data$Date2 > "2007-01-31" & data$Date2 < "2007-02-03")
subMetering1 <- as.numeric(data2$Sub_metering_1)
subMetering2 <- as.numeric(data2$Sub_metering_2)
subMetering3 <- as.numeric(data2$Sub_metering_3)

# Setup the datetime values
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Format the data to numeric
globalActivePower <- as.numeric(data2$Global_active_power)

# Plot the data
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

# Make the document
dev.copy(png, file="plot3.png")
dev.off()