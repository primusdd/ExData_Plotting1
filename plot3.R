## This script creates one of the plots as requested for week 1 of the Exploratory Data Analysis course on Coursera
## It is assumed that the needed data file household_power_consumption.txt is located in the working directory
## Created by Daniel Hubbeling, February 2018

## Set locale to Enlgish so decimals don't get screwed up
Sys.setlocale("LC_ALL","English")

## Load lubridate to make calculating dates easier
library(lubridate)


## Read the data
all_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", colClasses=c("character", "character", "character", "character", "character", "character", "character", "character", "character"))
plotdata<-subset(all_data, as.Date(Date, format="%d/%m/%Y")=="2007-02-01" | as.Date(Date, format="%d/%m/%Y")=="2007-02-02")
plotdata_clean<-subset(plotdata, Global_active_power!="?")

## Create the plot
plot(dmy(plotdata_clean$Date) + hms(plotdata_clean$Time), as.numeric(plotdata_clean$Sub_metering_1), col="black", type="l", ylab="Energy sub metering", xlab="")
lines(dmy(plotdata_clean$Date) + hms(plotdata_clean$Time),as.numeric(plotdata_clean$Sub_metering_2), col="red")
lines(dmy(plotdata_clean$Date) + hms(plotdata_clean$Time),as.numeric(plotdata_clean$Sub_metering_3), col="blue")

#add the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1)

## Create the PNG
dev.copy(png, "plot3.png", width=480, height=480, units="px")
dev.off()