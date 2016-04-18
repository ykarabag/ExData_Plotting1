

## Read the data and load into a data frame
data <- read.table("exploratory/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors = FALSE, na.strings="?")

## Convert the date field to date type
data$Date<-as.Date(data$Date,"%d/%m/%Y")


## Convert the Global Active Power Field to numeric type
data$Global_active_power <- as.numeric(data$Global_active_power)


## Subset the data to get 2-days reading only
data<-subset.data.frame(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

## Create combined date/time field
data$datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))


## Create the plot, save to PNG and close output device
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="exploratory/plot2.png", height=480, width=480)
dev.off()