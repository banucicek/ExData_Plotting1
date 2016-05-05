hpc_data <- read.table("./Data/household_power_consumption.txt",sep = ";",header = TRUE)
hpc_data$Date <- as.Date(hpc_data$Date,"%d/%m/%Y")
hpc_data$Sub_metering_1 <- as.numeric(as.character(hpc_data$Sub_metering_1))
hpc_data$Sub_metering_2 <- as.numeric(as.character(hpc_data$Sub_metering_2))

feb1st <- as.Date("2007-02-01")
feb2nd <- as.Date("2007-02-02")
feb1and2 <- subset(hpc_data,Date>=feb1st & Date<=feb2nd)
feb1and2$Global_active_power <- as.numeric(levels(feb1and2$Global_active_power))[feb1and2$Global_active_power]

png(filename = "plot3.png")

plot(strptime(paste(feb1and2$Date,feb1and2$Time),"%Y-%m-%d %H:%M:%S"),feb1and2$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
lines(strptime(paste(feb1and2$Date,feb1and2$Time),"%Y-%m-%d %H:%M:%S"),feb1and2$Sub_metering_1)
lines(strptime(paste(feb1and2$Date,feb1and2$Time),"%Y-%m-%d %H:%M:%S"),feb1and2$Sub_metering_2,col="red")
lines(strptime(paste(feb1and2$Date,feb1and2$Time),"%Y-%m-%d %H:%M:%S"),feb1and2$Sub_metering_3,col="blue")
legend("topright",pch = "-",col = c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()