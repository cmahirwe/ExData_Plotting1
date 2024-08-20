
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

## Plot 3

with(dat,{plot(Datetime, Sub_metering_1,type="l",
     xlab="", ylab="Energy sub metering")
     lines(Datetime, Sub_metering_2,col="Red")
     lines(Datetime, Sub_metering_3,col="Blue")
     })

legend("topright", col=c("black", "red", "blue"), lty=1,lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
