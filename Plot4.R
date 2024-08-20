
## Read the file
dat_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dat_full$Date <- as.Date(dat_full$Date, format="%d/%m/%Y")

##Subset the data
dat <- subset(dat_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dat_full)

##Convert the dates
str(dat)
datetime <- paste(as.Date(dat$Date), dat$Time)
dat$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2))

plot(dat$Datetime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(dat$Datetime, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dat$Datetime, dat$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dat$Datetime, dat$Sub_metering_2, type="l", col="red")
lines(dat$Datetime, dat$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(dat$Datetime, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
