
#Step 0. downolaod the zip file, read the raw data & prep data for plot
temp <- tempfile()
temp2 <-tempfile()


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
unzip(temp,list=TRUE)
unzip(zipfile=temp, exdir=temp2)

input_data <- read.csv(file.path(temp2,'household_power_consumption.txt',fsep='\\'),
                       sep=";", stringsAsFactors = FALSE)

library(lubridate)
input_data$Date <- dmy(input_data$Date)
input_data <- input_data[(input_data$Date >= '2007-02-01' & input_data$Date <= '2007-02-02'),]

input_data$Time <- hms(input_data$Time)
input_data$DateTime <- input_data$Date + input_data$Time

input_data$Global_active_power <- as.numeric(input_data$Global_active_power)
input_data$Sub_metering_1 <- as.numeric(input_data$Sub_metering_1)
input_data$Sub_metering_2 <- as.numeric(input_data$Sub_metering_2)
input_data$Sub_metering_3 <- as.numeric(input_data$Sub_metering_3)
input_data$Voltage <- as.numeric(input_data$Voltage)
input_data$Global_reactive_power <- as.numeric(input_data$Global_reactive_power)


## Plot2.R

plot(input_data$DateTime, input_data$Global_active_power,type="l",
     ylab="Global Active Power(kilowatts)", xlab="")

dev.copy(png,'plot2.png',width=480, height=480)
dev.off()
