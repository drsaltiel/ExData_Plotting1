#script for loading data and creating plot 4
#(assumes data was downloaded and is present locally in specified directory)

makePlot4<-function(dataLocation = "/home/daniel/data_science_coursera/exploratory_data_analysis/project1/household_power_consumption.txt"){
  #load data and subset relevant days  
  data<-read.table(dataLocation, header = TRUE, sep = ";", na.strings="?")
  subData<-subset(data, data$Date=='1/2/2007' | data$Date== '2/2/2007')
  
  #convert data/time columns to strptime
  DateTime<-strptime(paste(subData[,1],subData[,2]), format = "%d/%m/%Y %H:%M:%S")
  
  
  #plot 
  plotDataX<-DateTime
  png(filename = "Plot4.png", width = 480, height = 480)
  par(mfcol = c(2,2))
  #top left plot
  plot(plotDataX, as.numeric(subData[,3]),  ylab="Global Active Power", xlab="", type="l")
  #bottom left
  plot(plotDataX, as.numeric(subData[,7]),  ylab="Energy sub metering", xlab="", type="l")
  lines(plotDataX, as.numeric(subData[,8]), col="red")
  lines(plotDataX, as.numeric(subData[,9]), col="blue")
  legend_labels<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  legend("topright", legend = legend_labels, lty = "solid", col=c("black", "red", "blue"))
  #top right
  plot(plotDataX, as.numeric(subData[,5]), ylab="Voltage", xlab="datetime", type="l")
  #bottom right
  plot(plotDataX, as.numeric(subData[,4]), ylab="Global_reactive_power", xlab="datetime", type='l')
  par(bg=NA)
  dev.off()
  
}