##need data.table for fread below
library(data.table)

##read file - brute force solution
bruteFile<- fread("household_power_consumption.txt", na.strings="?")

##subset to the 2 dates of interest
interestData<-subset(bruteFile, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02"))


##open png device, to the respective png file, plot3.png
png(file = "plot3.png", width=480, height = 480)

##create the plot layout, with the vertical axis's label, and no horizontal axis label 
with (interestData, {
  time<-strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
  plot(time, Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
})

##add the first sub-metering points, in black, linear
with (interestData, {
  time<-strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
  points(time, Sub_metering_1, type = "l")
})

##add the second sub-metering points, in red, linear
with (interestData, {
  time<-strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
  points(time, Sub_metering_2, col="red", type = "l")
})

##add the thirds sub_metering points, in blue, linear, and the legend
with(interestData, {
  time<-strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
  points(time, Sub_metering_3, col="blue", type = "l")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=c(NA,NA,NA), lwd = 1, col=c("black", "red", "blue"))
})

##close the device
dev.off()
