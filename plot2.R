# TOF - 13/12/2015
dados<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting
dados<- subset(dados, (dados$Date == "1/2/2007" | dados$Date== "2/2/2007")) 

# change the date format
dados$Date <- as.Date(dados$Date, format = "%d/%m/%Y")
dados$DateTime <- as.POSIXct(paste(dados$Date, dados$Time))

# Plot2
png("plot2.png", width=480, height= 480)

plot(dados$DateTime, dados$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

dev.off()
