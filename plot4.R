
#########################################################################################################
# Function plot4() - Draw fout plotings showing data vs time
# Author: Jorge Gervasio Pereira - Date : November 7th, 2015


plot4 <- function(){
  
  library(ggplot2)
  
  originawd <-getwd()
  
  setwd("C:/Users/USUARIO PC/Documents/Cousera-Exploratory-Data-Analytics")
  
  png(filename = "plot/plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, family = "", restoreConsole = TRUE,type = c("windows", "cairo", "cairo-png"))
  
  
  df <- read.table("household_power_consumption.txt",sep = ";", header = TRUE,stringsAsFactors = FALSE)
  
  df_sub1 <- df[grep("^1/2/2007", df$Date), ]
  
  df_sub2 <- df[grep("^2/2/2007", df$Date), ]
  
  df_feb_1_2 <- rbind(df_sub1,df_sub2)
  
  # Generate date_time vector to plotting
  vector <- paste(df_feb_1_2$Date,df_feb_1_2$Time)
  
  date_hour <- strptime(vector,"%d/%m/%Y %H:%M:%S")
  
  
  # Convert Global Active Power to numeric
  
  df_feb_1_2$Global_active_power <- as.numeric(df_feb_1_2$Global_active_power)
  
  # Convert Voltage to numeric
  df_feb_1_2$Voltage <- as.numeric(df_feb_1_2$Voltage)
  
    
  # Convert Sub Metering Data to Numeric
  
  df_feb_1_2$Sub_metering_1 <- as.numeric(df_feb_1_2$Sub_metering_1)
  df_feb_1_2$Sub_metering_2 <- as.numeric(df_feb_1_2$Sub_metering_2)
  df_feb_1_2$Sub_metering_3 <- as.numeric(df_feb_1_2$Sub_metering_3)
  
  
  
  
  #Convert Global Reactive power to Numeric
  df_feb_1_2$Global_reactive_power <- as.numeric(df_feb_1_2$Global_reactive_power)
  
  
  
 # Make setup to plot in a 2 x 2 frame 
  par(mfrow=c(2,2))
  par(mar=c(4.0, 4.5, 0.5, 0.5))
  
  yrange<-range(c(df_feb_1_2$Sub_metering_1,df_feb_1_2$Sub_metering_2,df_feb_1_2$Sub_metering_3))
  
  # First plot is Global Active Power vs time
  plot(date_hour, df_feb_1_2$Global_active_power,type = "l",ylab = "Global Active Power")
  
  #Second plot is Voltage vs time
  plot(date_hour, df_feb_1_2$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")
  
  
  # Third plot is Sub Metering vs time
  plot(date_hour, df_feb_1_2$Sub_metering_1,type = "l",ylim=yrange,ylab = "Energy Sub Metering",col="black",xlab = "date")
  par(new=T)
  lines(date_hour,df_feb_1_2$Sub_metering_2,col="red")
  par(new=T)
  lines(date_hour,df_feb_1_2$Sub_metering_3,col="blue")
  
  legend("topright" ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(0.5,0.5,0.5),col=c("black","red","blue")) 
  
  par(new=F)
  
  #Fourth plot is Global Reactive Power vs Time
  plot(date_hour, df_feb_1_2$Global_reactive_power,type = "l",ylab = "Global Reactive Power",xlab = "datetime")
  
  
  dev.off()
  
  setwd(originawd)
}