library(data.table)

## read the features data
fName <- "./data/household_power_consumption.txt"
electric <- read.table(fName, sep=";", header=TRUE, stringsAsFactors=FALSE)

## convert date and time
electric$Date <- as.Date(electric$Date, format = "%d/%m/%Y")
electric$Time <- strptime(paste(electric$Date, electric$Time), "%Y-%m-%d %H:%M:%S")

## dates for which the data is needed
d <- as.Date(c("2007-02-01", "2007-02-02"), format="%Y-%m-%d")

## get the subset of data.
elec <- subset(electric, Date %in% d)

## convert the data into numeric
elec$Sub_metering_1 <- as.numeric(elec$Sub_metering_1)
elec$Sub_metering_2 <- as.numeric(elec$Sub_metering_2)
elec$Sub_metering_3 <- as.numeric(elec$Sub_metering_3)


## make the plot
png("Plot3.png", width=480, height=480)
plot(elec$Time, elec$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(elec$Time, elec$Sub_metering_2, col="red")
lines(elec$Time, elec$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off() ##  close the PNG device!
