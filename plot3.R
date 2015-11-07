#########################################################################################################
# Function plot3() - Plots Sub_meterings vs time period (February 1st, 2015 to Frebruary 2nd, 2015)
# Author: Jorge Gervasio Pereira - Date : November 7th, 2015


plot3 <- function(){
  
  library(ggplot2)
  
  originawd <-getwd()
  
  setwd("C:/Users/USUARIO PC/Documents/Cousera-Exploratory-Data-Analytics")
  
  # Open output device to write ( file plot3.png)
  png(filename = "plot/plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, family = "", restoreConsole = TRUE,type = c("windows", "cairo", "cairo-png"))
  
  
  # Read File as a data frame
  df <- read.table("household_power_consumption.txt",sep = ";", header = TRUE,stringsAsFactors = FALSE)
  
  
  # Sub setting data frame byt date
  df_sub1 <- df[grep("^1/2/2007", df$Date), ]
  
  df_sub2 <- df[grep("^2/2/2007", df$Date), ]
  
  df_feb_1_2 <- rbind(df_sub1,df_sub2)
  
  df_feb_1_2$Sub_metering_1 <- as.numeric(df_feb_1_2$Sub_metering_1)
  df_feb_1_2$Sub_metering_2 <- as.numeric(df_feb_1_2$Sub_metering_2)
  df_feb_1_2$Sub_metering_3 <- as.numeric(df_feb_1_2$Sub_metering_3)
  
  yrange<-range(c(df_feb_1_2$Sub_metering_1,df_feb_1_2$Sub_metering_2,df_feb_1_2$Sub_metering_3))
  
  vector <- paste(df_feb_1_2$Date,df_feb_1_2$Time)
  
  date_hour <- strptime(vector,"%d/%m/%Y %H:%M:%S")
  
  
  # Plot first Submetering, user par(new=T) to add file line plot of additional to graph
  plot(date_hour, df_feb_1_2$Sub_metering_1,type = "l",ylim=yrange,ylab = "Energy Sub Metering",col="black",xlab = "date")
  par(new=T)
  lines(date_hour,df_feb_1_2$Sub_metering_2,col="red")
  par(new=T)
  lines(date_hour,df_feb_1_2$Sub_metering_3,col="blue")
  
  # Draw legend explaining color coding for ploting
  
  legend("topright" ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))  
  
  # Close output device
  
   dev.off()
  
  setwd(originawd)
}