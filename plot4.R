plot4<-function (){
    powerdata<-read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings="?")
    powerdata<-within(powerdata, {datetime=strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")})
    powerdata<-powerdata[(powerdata$datetime>=strptime("2007-02-1","%Y-%m-%d"))&(powerdata$datetime<strptime("2007-02-03","%Y-%m-%d")),]
    powerdata<-powerdata[!is.na(powerdata$datetime),]
    png("plot4.png",width=480,height=480)
    par(mfcol=c(2,2))
    with(powerdata,plot(datetime,Global_active_power,type = "l", ylab="Global Active Power (kilowatts)",xlab=""))
    with(powerdata,plot(datetime,Sub_metering_1,type = "l", ylab="Energy sub metering",xlab=""))
    with(powerdata,lines(datetime,Sub_metering_2, col ="orangered"))
    with(powerdata,lines(datetime,Sub_metering_3, col="blue"))
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col = c("black","orangered","blue"),bty="n")
    with(powerdata,plot(datetime,Voltage,type = "l"))
    with(powerdata,plot(datetime,Global_reactive_power,type = "l"))
    dev.off()
}