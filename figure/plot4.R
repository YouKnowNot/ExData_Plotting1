#read data 
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#format date and time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
            #plot 1
            plot(data$Global_active_power~data$DateTime, type="l", 
                ylab="Global Active Power (kilowatts)", xlab="")
            
            #plot 2
            plot(data$Voltage~data$DateTime, type="l", 
                ylab="Voltage", xlab="")
            
            #plot 3
            with(data, plot(data$Sub_metering_1~data$DateTime, type="l", xlab="", 
                            ylab="Energy sub metering"))
            points(data$Sub_metering_2~data$DateTime, type="l",col="blue")
            points(data$Sub_metering_3~data$DateTime, type="l", col="red")
            legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
                   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
            
            #plot 4
            plot(data$Global_reactive_power~data$DateTime, type="l", 
                 ylab="Global reactive power", xlab="")})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
