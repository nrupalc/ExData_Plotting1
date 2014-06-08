pwrData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2","Sub_metering_3"), na.strings="?", skip=66637, nrows=2880, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric","numeric"))
win.graph()
datetimeStr <- paste(pwrData$Date, pwrData$Time)
dateTimeArr <- strptime(datetimeStr, "%d/%m/%Y %H:%M:%S")

plot(dateTimeArr, pwrData$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(dateTimeArr, pwrData$Sub_metering_1, type="l")
points(dateTimeArr, pwrData$Sub_metering_2, type="l", col="red")
points(dateTimeArr, pwrData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="_", cex=1, col=c("black","red","blue"), inset=0, text.width=strwidth("Sub_metering_1    "))


dev.copy(png, file="result/Plot3.png")
dev.off()
