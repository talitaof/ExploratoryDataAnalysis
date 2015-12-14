# TOF - 13/12/2015
dados<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting 
dados<- subset(dados, (dados$Date == "1/2/2007" | dados$Date== "2/2/2007")) 

# change the date format
dados$Date <- as.Date(dados$Date, format = "%d/%m/%Y")

dados$DateTime <- as.POSIXct(paste(dados$Date, dados$Time))



# Plot3

png("plot3.png", width = 480, height = 480)

plot(dados$DateTime, dados$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

lines(dados$DateTime, dados$Sub_metering_2, type="l", col="red")

lines(dados$DateTime, dados$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()
