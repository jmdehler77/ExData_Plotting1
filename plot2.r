# Load the data from the local flat file
data <- read.table("household_power_consumption.txt", header=T, sep=";")

# Format the date values properly
data$Date2 <- as.Date(data$Date, "%d/%m/%Y")

# Subset the data by date
data2 <-subset(data, data$Date2 > "2007-01-31" & data$Date2 < "2007-02-03")


# Setup the datetime values
datetime <- strptime(paste(data2$Date, data2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Format the data to numeric
globalActivePower <- as.numeric(data2$Global_active_power)

# Plot the data
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()