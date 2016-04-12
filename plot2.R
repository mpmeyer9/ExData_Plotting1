plot2<-function (){
    powerdata<-read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings="?")
    powerdata<-within(powerdata, {datetime=strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S")})
    powerdata<-powerdata[(powerdata$datetime>=strptime("2007-02-1","%Y-%m-%d"))&(powerdata$datetime<strptime("2007-02-03","%Y-%m-%d")),]
    powerdata<-powerdata[!is.na(powerdata$datetime),]
    png("plot2.png",width=480,height=480)
    with(powerdata,plot(datetime,Global_active_power,type = "l", ylab="Global Active Power (kilowatts)",xlab=""))
    dev.off()
}