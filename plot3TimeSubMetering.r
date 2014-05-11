## Create a line plot of color-coded sub-metering data over time
## Saves as a PNG to directory/file

plot3TimeSubMetering <- function(DT = getHousePowerAsDT(),
                                       file = "Plot3_Time_Sub_Metering.png",
                                       directory = "./") {
    # Set plot parameters
    labelY <- "Energy Sub-Metering"
    plotType <- "l"
    
    # Open PNG plot device to directory/file
    png(filename = paste(directory, file, sep = ""))
    
    # Create line plot for sub-metering 1
    with(DT, plot(Date_Time, Sub_metering_1, xlab = "", ylab = labelY,
                  type = "l"))
    
    # Add line for sub-metering 2 in red
    with(DT, lines(Date_Time, Sub_metering_2, col = "red"))
    
    # Add line for sub-metering 3 in blue
    with(DT, lines(Date_Time, Sub_metering_3, col = "blue"))    
    
    # Add legend in top-right corner
    legend("topright", legend = colnames(DT)[6:8],
           col = c("black", "red", "blue"), lwd = 2)
    
    # Close PNG plot device
    dev.off()
    
    # Return character vector of directory/file
    paste(directory, file, sep = "")
}