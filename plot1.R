source("load_data.R")
source("constants.R")

message("Loading data for plot1...")
data <- loadData(dataURL, dataFilename, dataDir)

message("Creating histogram and saving it to plot1.png file...")
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(data$Global_active_power, col = "#ff2500", main = "Global Active Power", ylab = "Frequency", xlab = "Global active power (kilowatts)")
dev.off()
message("Done.")
