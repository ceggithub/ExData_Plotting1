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
png(filename = "plot1.png", width = 480, height = 480)

# Plot graph
hist(dadosgraficos$Global_active_power, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")

# Close file
dev.off()