

## Read the data and load into a data frame
data <- read.table("exploratory/household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors = FALSE)

## Convert the date field to date type
data$Date<-as.Date(data$Date,"%d/%m/%Y")

## Convert the Global Active Power Field to numeric type
data$Global_active_power <- as.numeric(data$Global_active_power)


## Subset the data to get 2-days reading only
data<-subset.data.frame(data,Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02"))

## Create the histogram, save to PNG and close output device
hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.copy(png, file="exploratory/plot1.png", height=480, width=480)
dev.off()