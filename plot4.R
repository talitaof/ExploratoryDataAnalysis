# TOF - 13/12/2015

dados<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting 
dados<- subset(dados, (dados$Date == "1/2/2007" | dados$Date== "2/2/2007")) 

# change the date format
dados$Date <- as.Date(dados$Date, format = "%d/%m/%Y")

dados$DateTime <- as.POSIXct(paste(dados$Date, dados$Time))



# Plot4
png("plot4.png", width = 480, height = 480)

# divide the plot device into four subplots
par(mfrow=c(2,2)) 

# top left
plot(dados$DateTime, dados$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 

# top right
plot(dados$DateTime, dados$Voltage, type="l", xlab="datetime", ylab="Voltage")   

# bottom left
plot(dados$DateTime, dados$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(dados$DateTime, dados$Sub_metering_2, type="l", col="red")
lines(dados$DateTime, dados$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 

# bottom right
plot(dados$DateTime, dados$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

dev.off()
