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

png(file="plot2.png",width=480,height=480)

plot2<- plot(HW$blah, HW$Global_active_power, type="l", xlab=NA, ylab="Global Active Power")

dev.off()
