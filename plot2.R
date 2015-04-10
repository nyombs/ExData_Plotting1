##need data.table for fread below
library(data.table)

##read file - brute force solution
bruteFile<- fread("household_power_consumption.txt", na.strings="?")

##subset to the 2 dates of interest
interestData<-subset(bruteFile, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02"))

##open png device, to the repsective png file, plot2.png
png(file = "plot2.png", width=480, height = 480)

##draw the plot
##Global-active_power, 
##color = red, 
##y axis label = "Global Active Power (kilowatts)"
with(interestData, {
  time<-strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
  plot(time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
})

##close the device
dev.off()