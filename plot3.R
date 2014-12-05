setwd("~/programming/courses/04_ExploratoryAnalysis/project1")
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", 
                                        stringsAsFactors = FALSE, na.strings = c("?",""),
                                        colClasses=c("character","character", rep("numeric",7))
                                        )
hpc_min <- subset(household_power_consumption, Date == "1/2/2007" | Date == "2/2/2007")
rm(household_power_consumption)
hpc_min$Date <- as.Date(hpc_min$Date, "%d/%m/%Y")
# Create Date_Time variable
hpc_min$Date_Time <- paste(hpc_min$Date, hpc_min$Time)
hpc_min$Date_Time <- strptime(hpc_min$Date_Time, format="%Y-%m-%d %H:%M:%S")
#plot 3
png(filename="plot3.png", height=480, width=480, bg="white")
plot(hpc_min$Date_Time, hpc_min$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpc_min$Date_Time,hpc_min$Sub_metering_2, type="l", lty=1, col="red")
lines(hpc_min$Date_Time,hpc_min$Sub_metering_3, type="l", lty=1, col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
lty=c(1,1,1),      
lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
dev.off()
