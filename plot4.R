source("load_data.R")
source("constants.R")

message("Loading data for plot4...")
data <- loadData(dataURL, dataFilename, dataDir, convertDateTime = T)

message("Creating plot and saving it to plot4.png file...")
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

par(mfcol = c(2, 2))

with(data, plot(Date, Global_active_power, xlab = "", ylab = "Global active power", type = "l"))
with(data, {
    plot(Date, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
    points(Date, Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "#fb0007")
    points(Date, Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue")
    legend("topright", col = c("black", "#fb0007", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), bty = "n")
})
with(data, plot(Date, Voltage, xlab = "datetime", ylab = "Voltage", type = "l"))
with(data, plot(Date, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l"))

dev.off()
message("Done.")
