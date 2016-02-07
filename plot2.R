source("load_data.R")
source("constants.R")

message("Loading data for plot2...")
data <- loadData(dataURL, dataFilename, dataDir, convertDateTime = T)

message("Creating plot and saving it to plot2.png file...")
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(data$Date, data$Global_active_power, xlab = "", ylab = "Global active power (kilowatts)", type = "l")
dev.off()
message("Done.")
