# Load the data from the local flat file
data <- read.table("household_power_consumption.txt", header=T, sep=";")

# Format the date values properly
data$Date2 <- as.Date(data$Date, "%d/%m/%Y")


# Subset the data by date

data2 <-subset(data, data$Date2 > "2007-01-31" & data$Date2 < "2007-02-03")

# format the Global active power data to numeric from factor and format the x-scale
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

#Create the histogram with proper annotation
hist(data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file="plot1.png")
dev.off()