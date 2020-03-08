
########################################################
# Assignment course 4,  Week 1, plot 1
########################################################


# Downloading data:
if (!file.exists("raw_data.zip")){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, "raw_data.zip", method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
  unzip("raw_data.zip") 
}


# extract data of February first and second
names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <-  read.table( "household_power_consumption.txt", nrows=2881, skip=66637, sep=";", col.names = names ) 


# plot 1: histogram of Global Active Power feature:
with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab= "Global Active Power (kilowatts)" ))

# save the plot to a png file
png(filename = "plot1.png",width = 480, height = 480)
with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab= "Global Active Power (kilowatts)" ))
dev.off()
