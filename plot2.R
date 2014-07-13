## plots function xtrapolat data assign 1
plot2 <- function()  {
    
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
   
    ## plot 2 Global Active Power line graph with x axis as day of week
    par(mfrow=c(1,1))
    with(ndata,plot(Date_Time,Global_active_power,main="",ylab="Global Active Power (kilowatts)",xlab="",type="l"))
    dev.copy(png,"./plot2.png",width = 480, height = 480,units="px")
    dev.off()

}