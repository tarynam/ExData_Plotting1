setwd<-"/Applications/Desktop/"
hw<-read.table("/Applications/Old Computer/DataScience/household_power_consumption.txt", 
               header=TRUE, sep=";", na.strings="?",
               colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
               )
HW<-hw
HW$Date<-as.Date(HW$Date, format="%d/%m/%Y")
x<-paste(HW$Date,HW$Time)
strptime(x,"%Y-%m-%d %H:%M:%S")
HW$blah<-as.POSIXct(strptime(x,"%Y-%m-%d %H:%M:%S"))
HW<-filter(HW, 
             Date> "2007-01-31" & Date < "2007-02-03"
             )

png(file="plot3.png",width=480,height=480)

plot(HW$blah, HW$Sub_metering_1, type="l", ylab="Energy Submetering", xlab=NA)
lines(HW$blah, HW$Sub_metering_2, type="l", col="red", add=T)
lines(HW$blah, HW$Sub_metering_3, type="l", col="blue", add=T)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, cex=0.8)

dev.off()
