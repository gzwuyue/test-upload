data <-  read.table("household_power_consumption.txt", header=TRUE,
                   sep = ";", colClasses =c( rep("character",2), 
                   rep( "numeric", 7)), na.string="?", strip.white=T)
data2 <- rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
z = strptime(paste(data2$Date, data2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#graph 3: overlay line charts
png(file="plot3.png")
par(mfrow=c(1,1))
plot(z, data2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(z, data2$Sub_metering_2, type="l", col="red")
lines(z, data2$Sub_metering_3, type="l", col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()