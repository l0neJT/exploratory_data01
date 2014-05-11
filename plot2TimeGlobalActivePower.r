## Create a line plot of Global Active Power data over time
## Saves as a PNG to directory/file

plot2TimeGlobalActivePower <- function(DT = getHousePowerAsDT(),
                                   file = "Plot2_Time_Global_Active_Power.png",
                                   directory = "./") {
    # Set plot parameters
    labelY <- "Global Active Power (kilowats)"
    plotType <- "l"
    
    # Open PNG plot device to directory/file
    png(filename = paste(directory, file, sep = ""))
    
    # Create plot
    with(DT, plot(Date_Time, Global_active_power, xlab = "", ylab = labelY,
                  type = plotType))
    
    # Close PNG plot device
    dev.off()
    
    # Return character vector of directory/file
    paste(directory, file, sep = "")
}