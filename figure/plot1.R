#assignment 4 

#read data

df <- read.table("./household_power_consumption.txt" , sep = ";", header = T)

#remove records with "?" 
ind <- df$Global_active_power=="?"
df<-df[!ind,]

#extract the relavent data
library(lubridate)
df$Date <- dmy(df$Date)
f <- (df$Date=="2007-02-02" | df$Date=="2007-01-01")
tidy <- df[f,]

#plot 1
tidy$Global_active_power <- as.numeric(tidy$Global_active_power)
hist(tidy$Global_active_power/1000, ylab = "frequency", 
     xlab = "Global active power (kilowatts)", col="red", 
     xlim = c(0,3), main = "Global active power")

dev.copy( png, file="./plot1.png",height=480, width=480)
dev.off()



