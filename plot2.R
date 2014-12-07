data <-  read.table("household_power_consumption.txt", header=TRUE,
                   sep = ";", colClasses =c( rep("character",2), 
                   rep( "numeric", 7)), na.string="?", strip.white=T)
data2 <- rbind(data[data$Date=="1/2/2007",],data[data$Date=="2/2/2007",])
z = strptime(paste(data2$Date, data2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# graph 2: line chart
png(file="plot2.png")
par(mfrow=c(1,1))
# as.POSIXct(strptime(paste(data2$Date, data2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))
# lines(z, data2$Global_active_power, type="l")
plot(z, data2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=" ")
dev.off()