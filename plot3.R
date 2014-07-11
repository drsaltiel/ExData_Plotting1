#script for loading data and creating plot 3
#(assumes data was downloaded and is present locally in specified directory)

makePlot3<-function(dataLocation = "/home/daniel/data_science_coursera/exploratory_data_analysis/project1/household_power_consumption.txt"){
  #load data and subset relevant days  
  data<-read.table(dataLocation, header = TRUE, sep = ";", na.strings="?")
  subData<-subset(data, data$Date=='1/2/2007' | data$Date== '2/2/2007')
  
  #convert data/time columns to strptime
  DateTime<-strptime(paste(subData[,1],subData[,2]), format = "%d/%m/%Y %H:%M:%S")
  
  
  #plot 
  plotDataX<-DateTime
  plotDataY1<-as.numeric(subData[,7])
  plotDataY2<-as.numeric(subData[,8])
  plotDataY3<-as.numeric(subData[,9])
  png(filename = "Plot3.png", width = 480, height = 480)
  plot(plotDataX, plotDataY1,  ylab="Energy sub metering", xlab="", type="l")
  lines(plotDataX, plotDataY2, col="red")
  lines(plotDataX, plotDataY3, col="blue")
  par(bg=NA)
  legend_labels<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  legend("topright", legend = legend_labels, lty = "solid", col=c("black", "red", "blue"))
  dev.off()
  
}