#PLOT1
#set working directory to have the png file saved
setwd("C:/Users/Harish/Documents/GitHub/ExData_Plotting1/")
#Load the entire dataset as mydata
mydata <- read.table("C:/Users/Harish/Desktop/Coursera/Exploratory data analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header = 
                       TRUE, sep = ";",colClasses = c("character", "character", rep("numeric",7)), na = "?")
#create criteria for filtering with the two dates specified
subset <- mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007"
#create new dataset with the two dates fitered - plotData
plotData <- mydata[subset, ]
#graphics device - png
png(filename = "plot1.png",
    width = 480, height = 480, units = "px",
    bg = "white")
#Create the histogram
lt <- c(0,1200)
hist(plotData$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (Killowats)",col="red",ylim=lt)
dev.off()
