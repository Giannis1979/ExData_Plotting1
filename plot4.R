# ---- Set working Dir ----------------------------------------------------------------
setwd("C:/Users/John/Documents/Coursera/Exploratory Data Analysis/Week1/")
getwd()
#--------------------------------------------------------------------------------------

#---------- Download and unzip data file ----------------------------------------------------
#url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url,"ElectricPowerConsumption.zip")
#unzip("ElectricPowerConsumption.zip", exdir = ".")
#-------------------------------------------------------------------------------------------

# read and subset data
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,row.names=NULL)
data<-subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

#--- combine date and time
Date2<-as.Date(data$Date,"%d/%m/%Y")
Time<- data$Time
date_time<-strptime(paste(Date2,Time,sep=" "),format="%Y-%m-%d %H:%M:%S")
data<-cbind(as.data.frame(date_time),as.data.frame(Date2),as.data.frame(data))
#------------------------------------------------

#----plot 4
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfrow=c(2,2))
GlobalActivePower<-as.numeric(as.vector(data$Global_active_power))
plot(data$date_time,GlobalActivePower,type="l",xlab="",ylab="Global Active Power")
Voltage<-as.numeric(as.vector(data$Voltage))
plot(data$date_time,Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(data$date_time,as.numeric(as.vector(data$Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="")
lines(data$date_time,as.numeric(as.vector(data$Sub_metering_2)),col="red")
lines(data$date_time,as.numeric(as.vector(data$Sub_metering_3)),col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty='n', cex=.75) 

Global_reactive_power<-as.numeric(as.vector(data$Global_reactive_power))
plot(data$date_time,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()

