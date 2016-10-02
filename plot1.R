# Reading the dataset
df_raw <- read.csv("./Data/household_power_consumption.txt",
                   header=T, sep=';', na.strings="?", check.names=F,
                   stringsAsFactors=F, comment.char="", quote='\"')
df_raw$Date <- as.Date(df_raw$Date, format="%d/%m/%Y")

# Subsetting the data
df_tidy <- subset(df_raw, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Plotting histogram to screen
hist(df_tidy$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Copying to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

