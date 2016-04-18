## Coursera - Exploratory Data Analysis
## Assignment Week01

# Set dir
setwd("/home/carlos/coursera/R/ExploratoryDataAnalysis")

# Download file and load
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
dados <- read.csv(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?")
unlink(temp)

# Convert date and time cols
dados$datetime <- strptime(paste(dados$Date, dados$Time), format = "%d/%m/%Y %H:%M:%S")
dadosgraficos <- subset(dados, datetime >= "2007-02-01" & datetime < "2007-02-03")
rm(dados)

# Init file create
png(filename = "plot3.png", width = 480, height = 480)

# Plot graph
plot(dadosgraficos$datetime, dadosgraficos$Sub_metering_1, type = "n", ylab = "Energy Sub Metering", xlab = "")
lines(dadosgraficos$datetime, dadosgraficos$Sub_metering_1, col = "black")
lines(dadosgraficos$datetime, dadosgraficos$Sub_metering_2, col = "red")
lines(dadosgraficos$datetime, dadosgraficos$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))

# Close file
dev.off()