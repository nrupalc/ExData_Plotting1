pwrData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3"), na.strings="?", skip=66637, nrows=2880, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric","numeric"))
win.graph(width=480, height=480)

datetimeStr <- paste(pwrData$Date, pwrData$Time)
dateTimeArr <- strptime(datetimeStr, "%d/%m/%Y %H:%M:%S")
plot(dateTimeArr, pwrData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="Plot2.png")
dev.off()
