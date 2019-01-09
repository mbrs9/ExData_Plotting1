## File URL
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
##__________________________________________________________

## Download File to working directory:
if(!file.exists("./household_power_consumption.txt")){
        download.file(fileURL, destfile = "exdata_data_household_power_consumption.zip")
        unzip("./exdata_data_household_power_consumption.zip")
}
##__________________________________________________________


## Read the data from the .txt file in the working directory:

epcdata <- read.table(file = "household_power_consumption.txt", 
                      header = TRUE, na.strings = "?", sep = ";", 
                      col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                    "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                      stringsAsFactors = FALSE)
##___________________________________________________________

##Change the "Time" variable to time format:
epcdata$Time <- strptime(paste(epcdata$Date, epcdata$Time), format = "%d/%m/%Y %H:%M:%S")
##___________________________________________________________

## Change the "Date" variable to date format:

epcdata$Date <- as.Date(epcdata$Date, "%d/%m/%Y")
##___________________________________________________________

## Select only 2007-02-01 & 2007-02-02 days:

epcdata <- subset(epcdata, epcdata$Date >= "2007-02-01" & epcdata$Date<= "2007-02-02")
##___________________________________________________________

## Create plot1 into PNG file:
png(filename = "plot1.png", width = 480, height = 480)
with(epcdata, hist(Global_active_power, col = "brown3", xlab = "Global Active Power (killowatts)",
                   main = "Global Active Power"))
dev.off()