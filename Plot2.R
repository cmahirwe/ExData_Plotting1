
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

## Plot 2

plot(dat$Datetime, dat$Global_active_power,type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()