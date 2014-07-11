#script for loading data and creating plot 2
#(assumes data was downloaded and is present locally in specified directory)

makePlot2<-function(dataLocation = "/home/daniel/data_science_coursera/exploratory_data_analysis/project1/household_power_consumption.txt"){
  #load data and subset relevant days  
  data<-read.table(dataLocation, header = TRUE, sep = ";", na.strings="?")
  subData<-subset(data, data$Date=='1/2/2007' | data$Date== '2/2/2007')
  
  #convert data/time columns to strptime
  DateTime<-strptime(paste(subData[,1],subData[,2]), format = "%d/%m/%Y %H:%M:%S")
  
  
  #plot 
  plotDataX<-DateTime
  plotDataY<-as.numeric(subData[,3])
  png(filename = "Plot2.png", width = 480, height = 480)
  plot(plotDataX, plotDataY,  ylab="Global Active Power (kilowatts)", xlab="", type="l")
  par(bg=NA)
  dev.off()
  
}