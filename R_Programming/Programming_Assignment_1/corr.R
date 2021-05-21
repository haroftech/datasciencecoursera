corr <- function(directory, threshold = 0) {
    control <- 1
    correlationVector <- c()
    
    folder <- paste(dirname(rstudioapi::getSourceEditorContext()$path), 
                    "/" ,directory, sep = "")
    files <-  list.files(folder, pattern = ".", all.files = FALSE, 
                         recursive = TRUE, full.names = TRUE)
    
    for (i in 1:length(files)) {
        fullpath <- ""
        if (i < 10) {
            fullpath <- paste(directory, "/", "00", i, ".csv", sep = "")
        } else if (i < 100) {
            fullpath <- paste(directory, "/", "0", i, ".csv", sep = "")
        } else {
            fullpath <- paste(directory, "/", i, ".csv", sep = "")
        }
        data <- read.table(fullpath, header = TRUE, sep = ",")
        dataGood <- na.omit(data)
        dataGoodLength <- nrow(dataGood)
        if (dataGoodLength > threshold) {
            sulfateData <- dataGood[,("sulfate")]
            nitrateData <- dataGood[,("nitrate")]
            correlationVector[control] <- cor(sulfateData,nitrateData)
            control <- control + 1   
        }
    }
    
    correlationVector    
}