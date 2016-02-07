## Loads data (if needed) from the url, reads it into THE memory and subsets the interval from 2007-02-01 to 2007-02-02.
## 
## Args:
##   url: URL of zip-archive with data.
##   dataFilename: Filename of the data file.
##   dataDir: Directory where data should be stored.
##   convertDateTime: If TRUE, Date and Time columns merge and column Time removes.
loadData <- function(url, dataFilename, dataDir = ".", convertDateTime = F) {
    dataFile <- paste0(paste0(dataDir, "/"), dataFilename)
    
    if (!dir.exists(dataDir)) {
        dir.create(dataDir)
    }
    
    if (!file.exists(dataFile)) {
        message("Downloading data....")
        temp <- tempfile()
        download.file(url,temp)
        unzip(temp, exdir = dataDir)
        unlink(temp)
    }
    message("Data is located.")
    message("Reading data...")
    data <- read.csv(dataFile, header = T, sep = ";", na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), stringsAsFactors = F)
    message("Data is successfully read.")
    
    message("Subsetting data...")
    data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
    message("Data is successfully subsetted.")
    
    if (convertDateTime) {
        message("Converting date and time...")
        data$Date <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
        data <- data[, !(names(data) %in% "Time")]
        message("Date and time are converted.")
    }
    
    message("Data is ready to be proceeded.")
    data
}
