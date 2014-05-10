## Create data table for household power consumption from 2007-02-01 thru 02
## Simplifies re-loading by storing offset from first observation and the count
## of observations over two days. Data begins 2006-12-16 at 17:14. Prints head
## and tail to console for confirmation

getHousePowerAsDT <- function(file = "household_power_consumption.txt",
                              directory = "./exdata_household_power/") {
    # Load 'data.table' library
    library(data.table)
    
    dirFile <- paste(directory, file, sep = "")
    start <- (16 + 31) * 24 * 60 - 1043 # feel free to check my math!
    rows <- 2 * 24 * 60
    
    # Create data frame
    DT <- fread(dirFile, nrows = rows, skip = start, na.string = "?")
    
    # Add column names
    DTcols <- colnames(fread(dirFile, nrows = 1))
    setnames(DT, DTcols)
    
    # Create POSIXct list from Date and Time columns
    dateTime <- DT[, strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
    DT[, Date_Time := as.POSIXct(dateTime)]
    
    # Remove Date and Time columns
     DT[, c("Date", "Time") := NULL]
    
    # Reorder columns with Date_Time first
     setcolorder(DT, c(length(DT), 1:(length(DT) - 1)))
    
    # Print head and tail for confirmation
    message("Head:")
    print(head(DT, n = 3))
    message("Tail:")
    print(tail(DT, n = 3))
    
    # Return data frame
    DT    
}