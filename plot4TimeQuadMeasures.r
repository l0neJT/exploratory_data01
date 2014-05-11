## Create a line plot of color-coded sub-metering data over time
## Saves as a PNG to directory/file

plot4TimeQuadMeasures <- function(DT = getHousePowerAsDT(),
                                 file = "Plot4_Time_Quad_Measures.png",
                                 directory = "./") {
    # Open PNG plot device to directory/file
    png(filename = paste(directory, file, sep = ""))
    
    # Set global plotting parameters
    par(mfrow = c(2, 2))
    
    # 
    with(DT, {
        # Create plot 1 for Global Active Power data over time
        labelY <- "Global Active Power (kilowats)"      
        plot(Date_Time, Global_active_power, xlab = "", ylab = labelY,
             type = "l")
    
        # Create plot 2 for Voltage data over time
        labelY <- "Voltage"
        labelX <- "Date Time"
        plot(Date_Time, Voltage, xlab = labelX, ylab = labelY,
             type = "l")
        
        # Create plot 3 for color-coded sub-metering data over time
        labelY <- "Energy Sub Metering"
        plot(Date_Time, Sub_metering_1, xlab = "", ylab = labelY,
             type = "l")
        lines(Date_Time, Sub_metering_2, col = "red")
        lines(Date_Time, Sub_metering_3, col = "blue")
        legend("topright", legend = colnames(DT)[6:8],
               col = c("black", "red", "blue"), lwd = 1, bty = "n")
        
        # Create plot 4 for Global Reactive Power data over time
        labelY <- "Global Reactive Power"
        labelX <- "Date Time"
        plot(Date_Time, Global_reactive_power, xlab = labelX,
             ylab = labelY, type = "l")
    })
    
    # Close PNG plot device
    dev.off()
    
    # Return character vector of directory/file
    paste(directory, file, sep = "")
}