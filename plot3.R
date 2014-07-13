## plots function xtrapolat data assign 1
plot3 <- function()  {
    
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
    
    ## plot 3 Energy Sub Metering 1/2/3 color lines with x axis days of week
    png("./plot3.png",width = 480, height = 480,units="px")
    par(mfrow=c(1,1))
    with(ndata,plot(Date_Time,Sub_metering_1,main="",ylab="Energy sub metering",xlab="",type="l",col="black"))
    with(ndata,points(Date_Time,Sub_metering_2,type="l",col="red"))
    with(ndata,points(Date_Time,Sub_metering_3,type="l",col="blue"))
    legend("topright",lty="solid",col=c("black","red","blue"),legend=c(names(ndata[6:8])))
    dev.off()  
 
}