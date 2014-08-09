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
elec$Global_active_power <- as.numeric(elec$Global_active_power)

## make the plot
png("Plot1.png", width=480, height=480)
hist(elec$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col = "red")

dev.off() ##  close the PNG device!
