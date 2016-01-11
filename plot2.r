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

#---- plot 2
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(data$date_time,GlobalActivePower,type="l",xlab="",ylab="Global Active Power (Killowats)")

dev.off()

