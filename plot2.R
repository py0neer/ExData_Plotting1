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
plot(df_tidy$Global_active_power~df_tidy$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Copying to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

