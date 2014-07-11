#script for loading data and creating plot 1
#(assumes data was downloaded and is present locally in specified directory)

makePlot1<-function(dataLocation = "/home/daniel/data_science_coursera/exploratory_data_analysis/project1/household_power_consumption.txt"){
  #load data and subset relevant days  
  data<-read.table(dataLocation, header = TRUE, sep = ";", na.strings="?")
  subData<-subset(data, data$Date=='1/2/2007' | data$Date== '2/2/2007')
  
  #plot desired histogram
  plotData<-as.numeric(subData[,3], na.rm=TRUE)
  png(filename = "Plot1.png", width = 480, height = 480)
  hist(plotData, col="red", breaks = 12, main="Global Active Power", xlab="Global Active Power (kilowatts)")
  par(bg=NA)
  dev.off()
  
}