############ plot1.R ######################
# Plots Global Active Power Histogram     #
# Assignment 1, Exploratory Data Analysis #
###########################################

# Import data from household_power_consumption.txt

householdPower <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=2075259, 
# Ensure that na.strings="?" to avoid Factors problems
	na.strings="?");

# Create a subset for dates of interest, 01-02-2007 and 02-02-2007
householdPowerFeb <- subset(householdPower, as.Date(Date, format="%d/%m/%Y") == as.Date('2007-02-01') | as.Date(Date, format="%d/%m/%Y") == as.Date('2007-02-02'))

# Concatenate Date and Time variables into dateAndTime
tempDateTime <- paste(householdPowerFeb$Date, householdPowerFeb$Time)
# strptime() new date/time vector and add as column to householdPowerFeb
householdPowerFeb$DateTime <- strptime(tempDateTime, "%d/%m/%Y %H:%M:%S")


## Change Device to PNG, save to plot3.png, 480x480 px
png(filename="plot3.png", width=480, height=480)

# Set margins for plot at root level
par(mar=c(5,5,2,2))

# Plot line of variable Sub_metering_1 against DateTime
plot(householdPowerFeb$DateTime, householdPowerFeb$Sub_metering_1, ylab="Energy sub metering", xlab="",  type="l")

# Further plot line of variable Sub_metering_2 against DateTime in red colour
lines(householdPowerFeb$DateTime, householdPowerFeb$Sub_metering_2, col="red")

# Further plot line of variable Sub_metering_3 against DateTime in blue colour
lines(householdPowerFeb$DateTime, householdPowerFeb$Sub_metering_3, col="blue")

# Draw legend in top-right corner with lines of width 1 matching variable plot line colours
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, col=c("black","red","blue"))

# Turn off PNG device
dev.off()


