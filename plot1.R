##need data.table for fread below
library(data.table)

##read file - brute force solution
bruteFile<- fread("household_power_consumption.txt", na.strings="?")

##subset to the 2 dates of interest
interestData<-subset(bruteFile, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

##open png device, to the repsective png file, plot1.png
png(file = "plot1.png", width=480, height = 480)

##draw the histogram
##Global-active_power, 
##color = red, 
##title = "Global Active Power"
##x axis label = "Global Active Power (kilowatts)"
hist(as.numeric(interestData$Global_active_power), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##close the device
dev.off()
