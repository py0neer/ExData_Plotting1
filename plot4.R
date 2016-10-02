# Reading the dataset
df_raw <- read.csv("./Data/household_power_consumption.txt",
                   header=T, sep=';', na.strings="?", check.names=F,
                   stringsAsFactors=F, comment.char="", quote='\"')
df_raw$Date <- as.Date(df_raw$Date, format="%d/%m/%Y")

# Subsetting the data
df_tidy <- subset(df_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(df_tidy$Date), df_tidy$Time)
df_tidy$DateTime <- as.POSIXct(datetime)

# Plotting to screen
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df_tidy, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", inset=c(0.08,0), col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global_reactive_power", xlab="datetime")
})

## Saving to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
