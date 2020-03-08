

########################################################
# Assignment course 4,  Week 1, plot 4
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

# Creating a new column of the full date and converting its type
data$fullDate <- apply(select(data, c("Date", "Time")), MARGIN = 1, function(x){paste(x[1], x[2])})
data$fullDate <- strptime(data$fullDate, format = "%d/%m/%Y %H:%M:%S")

#plot 4: 
par(mfrow = c(2, 2))

with(data, plot(x=fullDate, y=Global_active_power, type="l", main="",xlab="",  ylab= "Global Active Power" ))

with(data, plot(fullDate, Voltage,type="l", main="",xlab="datetime",  ylab= "Voltage" ))

with(data, plot(x=fullDate, y=Sub_metering_1, col="black", type="l", main="",xlab="",  ylab= "Energy sub metering" ))
with(data, lines(fullDate, y=Sub_metering_2, col="red", type="l" ))
with(data, lines(fullDate, y=Sub_metering_3, col="blue", type="l" ))
legend("topright",
       pch = "-",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(x=fullDate, y=Global_reactive_power, type="l", main="",xlab="datetime"))


# save the plot to a png file
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2, 2))

with(data, plot(x=fullDate, y=Global_active_power, type="l", main="",xlab="",  ylab= "Global Active Power" ))

with(data, plot(fullDate, Voltage,type="l", main="",xlab="datetime",  ylab= "Voltage" ))

with(data, plot(x=fullDate, y=Sub_metering_1, col="black", type="l", main="",xlab="",  ylab= "Energy sub metering" ))
with(data, lines(fullDate, y=Sub_metering_2, col="red", type="l" ))
with(data, lines(fullDate, y=Sub_metering_3, col="blue", type="l" ))
legend("topright",
       pch = "-",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(x=fullDate, y=Global_reactive_power, type="l", main="",xlab="datetime"))

dev.off()

