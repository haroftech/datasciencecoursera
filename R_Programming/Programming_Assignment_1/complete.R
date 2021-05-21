complete <- function(directory, id = 1:332) {
    control <- 1
    completeCasesTable <- data.frame(id = id, 
                                nobs = vector("numeric", length = length(id)))
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
        dataGood <- na.omit(data)
        dataGoodLength <- nrow(dataGood)
        completeCasesTable[control,"nobs"] <- nrow(dataGood)
        control <- control + 1
    }
    
    completeCasesTable
}