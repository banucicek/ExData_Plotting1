hpc_data <- read.table("./Data/household_power_consumption.txt",sep = ";",header = TRUE)
hpc_data$Date <- as.Date(hpc_data$Date,"%d/%m/%Y")
feb1st <- as.Date("2007-02-01")
feb2nd <- as.Date("2007-02-02")
feb1and2 <- subset(hpc_data,Date>=feb1st & Date<=feb2nd)
feb1and2$Global_active_power <- as.numeric(levels(feb1and2$Global_active_power))[feb1and2$Global_active_power]

png(filename = "plot1.png")
par(mfrow = c(1,1))
hist(feb1and2$Global_active_power, 
     main = "Global Active Power",
     col="red",
     xlab = "Global Active Power (kilowatts)")

dev.off()