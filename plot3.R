#PLOT3
#set working directory to have the png file saved
setwd("C:/Users/Harish/Documents/GitHub/ExData_Plotting1/")
#Load the entire dataset as mydata
mydata <- read.table("C:/Users/Harish/Desktop/Coursera/Exploratory data analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header = 
                       TRUE, sep = ";",colClasses = c("character", "character", rep("numeric",7)), na = "?")
#create criteria for filtering with the two dates specified
subset <- mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007"
#create new dataset with the two dates fitered - plotData
plotData <- data[subset, ]
#correct format
plotData$DateTime <- as.POSIXct(strptime(paste(plotData$Date,plotData$Time), "%d/%m/%Y %H:%M:%S"))
#graphics device - png
png(filename = "plot3.png",
    width = 480, height = 480, units = "px",
    bg = "white")
plot(x=plotData$DateTime,y=plotData$Sub_metering_1,type="l",
     xlab="",ylab="Energy Sub Meetering")
lines(x=plotData$DateTime,y=plotData$Sub_metering_2, type="l",col="red")
lines(x=plotData$DateTime,y=plotData$Sub_metering_3, type="l",col="blue")
legendTxt <-c("Sub Meetering 1","Sub Meetering 2", "Sub Meetering 3")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))
dev.off()