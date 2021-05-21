pollutantmean <- function(directory, pollutant, id = 1:332) {
    control <- 1
    numValues <- 0    
    sumColumns <- 0
    
    for (i in id) {
        fullpath <- ""
        if (i < 10) {
            fullpath <- paste(directory, "/", "00", i, ".csv", sep = "")
        } else if (i < 100) {
            fullpath <- paste(directory, "/", "0", i, ".csv", sep = "")
        } else {
            fullpath <- paste(directory, "/", i, ".csv", sep = "")
        }
        data <- read.table(fullpath, header = TRUE, sep = ",")
        columnData <- data[,(pollutant)]
        columnDataNARemoved <- na.omit(columnData)
        numValues <- numValues + length(columnDataNARemoved)
        sumColumns <- sumColumns + sum(columnDataNARemoved)
        control <- control + 1
    }
    
    sumColumns/numValues
}
