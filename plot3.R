source("load_data.R")
source("constants.R")

message("Loading data for plot3...")
data <- loadData(dataURL, dataFilename, dataDir, convertDateTime = T)

message("Creating plot and saving it to plot3.png file...")
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
with(data, {
     plot(Date, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
     points(Date, Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "#fb0007")
     points(Date, Sub_metering_3, xlab = "", ylab = "Energy sub metering", type = "l", col = "blue")
     legend("topright", col = c("black", "#fb0007", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1))
})
dev.off()
message("Done.")
