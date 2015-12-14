# TOF - 13/12/2015
dados<- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting
dados<- subset(dados, (dados$Date == "1/2/2007" | dados$Date== "2/2/2007")) 

# Plot1
png("plot1.png", width=480, height= 480)

hist(dados$Global_active_power, col= "red", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", main= "Global Active Power")




