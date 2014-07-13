## plots function xtrapolat data assign 1
plot4 <- function()  {
    
    ## read in the pertinent data
    cnames=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
    cclasses=c("Date","Time",numeric,numeric,numeric,numeric,numeric,numeric,numeric)

    ## line 66638 starts 1/2/2007 and 69517 ends 2/2/2007 = 2879 data points
    data<-read.table("household_power_consumption.txt",comment.char="",sep=";",nrows=2880,skip=66637,col.names=cnames)

    ## convert seperate "Date" and "Time" columns into a single Date column
    dt<-paste(data$Date,data$Time)
    Date_Time<-strptime(dt,format="%d/%m/%Y %H:%M:%S")
    
    ## create new dataset with the replaced date data, 
    ndata<-cbind(Date_Time,data[,3:9])
    names(ndata)

    ## plot 4 is 4 plots (2x2) : pos 1 is plot 2, pos 3 is plot 3
    ##                           pos 2 is line graph of Voltage with days of week on x
    ##                           pos 4 is line graph of global reactive power with days of week on x
    png("./plot4.png",width = 480, height = 480,units="px")
    par(mfcol=c(2,2))
    #pos [1,1]
    with(ndata,plot(Date_Time,Global_active_power,main="",ylab="Global Active Power (kilowatts)",xlab="",type="l"))
    #pos[2,1]
    with(ndata,plot(Date_Time,Sub_metering_1,main="",ylab="Energy sub metering",xlab="",type="l",col="black"))
    with(ndata,points(Date_Time,Sub_metering_2,type="l",col="red"))
    with(ndata,points(Date_Time,Sub_metering_3,type="l",col="blue"))
    legend("topright",lty="solid",bty="n",col=c("black","red","blue"),legend=c(names(ndata[6:8])))
    #pos[1,2]
    with(ndata,plot(Date_Time,Voltage,main="",ylab="Voltage",xlab="datetime",type="l"))
    #pos[2,2]
    with(ndata,plot(Date_Time,Global_reactive_power,main="",xlab="datetime",type="l"))
    dev.off()
    
}