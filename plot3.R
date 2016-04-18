

## Read the data and load into a data frame
data <- read.table("exploratory/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings="?")

## Convert the date field to date type
data$Date<-as.Date(data$Date,"%d/%m/%Y")


## Convert the Sub metering fields to numeric type
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


## Subset the data to get 2-days reading only
data<-subset.data.frame(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

## Create combined date/time field
data$datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))


## Create the plot, save to PNG and close output device
with(data,plot(Sub_metering_1~datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))
with(data,lines(Sub_metering_2~datetime,col='Red'))
with(data,lines(Sub_metering_3~datetime,col='Blue'))

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="exploratory/plot3.png", height=480, width=480)
dev.off()