## Create a histogram of Global Active Power data
## Saves as a PNG to directory/file

plot1GlobalActivePower <- function(DT = getHousePowerAsDT(),
                                  file = "Plot1_Global_Active_Power.png",
                                  directory = "./") {
    # Set plot parameters
    labelMain <- "Global Active Power"
    labelX <- "Global Active Power (kilowats)"
    color <- "red"
    
    # Open PNG plot device to directory/file
    png(filename = paste(directory, file, sep = ""))
    
    # Create plot
    hist(DT$Global_active_power, main = labelMain, xlab = labelX, col = color)
    
    # Close PNG plot device
    dev.off()
    
    # Return character vector of directory/file
    paste(directory, file, sep = "")
}