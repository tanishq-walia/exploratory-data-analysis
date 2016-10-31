datap1=read.table(file ="/media/hduser/New Volume1/course /course1/exploratory-data-analysis/household_power_consumption.txt",sep=";",header = TRUE)
datap1$Date=as.Date(datap1$Date,format="%d/%m/%Y")
class(datap1$Date)
subdata=datap1[(datap1$Date=="2007-02-01")|(datap1$Date=="2007-02-02") ,]
dim(subdata)
class(subdata$Global_active_power)
View(subdata)
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
subdata$Global_reactive_power<-as.numeric(as.character(subdata$Global_reactive_power))
class(subdata$Global_active_power)
subdata$Voltage<-as.numeric(as.character(subdata$Voltage))
subdata<-transform(subdata,timestamp=as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")
subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))


#plot 1
par(mfrow=c(1,1))
plot1 <- function() {
        hist(subdata$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
        cat("Plot1.png has been saved in", getwd())
}
plot1()

