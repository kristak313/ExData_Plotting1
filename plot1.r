## Read full file
allData <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

## Subsetting collected data as specified
data <- subset(allData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(allData)

## Convert dates as specified
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Create plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Copy plot to PNG file with specified height and width
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
