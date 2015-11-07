#########################################################################################################
# Function plot2() - Plots Global Active Power vs time period (February 1st, 2015 to Frebruary 2nd, 2015)
# Author: Jorge Gervasio Pereira - Date : November 7th, 2015

plot2 <- function(){
  
  library(ggplot2)
  
  originawd <-getwd()
  
  setwd("C:/Users/USUARIO PC/Documents/Cousera-Exploratory-Data-Analytics")
  
  # Set output device (plot2.png file)
  
  png(filename = "plot/plot2.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, family = "", restoreConsole = TRUE,type = c("windows", "cairo", "cairo-png"))
  
  # Read file as data frame, each column contains strings
  
  df <- read.table("household_power_consumption.txt",sep = ";", header = TRUE,stringsAsFactors = FALSE)
  
  #Sub set data frame using grep
  
  df_sub1 <- df[grep("^1/2/2007", df$Date), ]
  
  df_sub2 <- df[grep("^2/2/2007", df$Date), ]
  
  df_feb_1_2 <- rbind(df_sub1,df_sub2)
  
  # Convert Global Active power Values to numeric
  
  df_feb_1_2$Global_active_power <- as.numeric(df_feb_1_2$Global_active_power)
  
  # Extract Date string values and convert to Date data type
  vector <- paste(df_feb_1_2$Date,df_feb_1_2$Time)
  
  date_hour <- strptime(vector,"%d/%m/%Y %H:%M:%S")
  
  # Plot Global Active Power vs period of time
  plot(date_hour, df_feb_1_2$Global_active_power,type = "l",ylab = "Global Active Power (kilowatt)",xlab = "date",main = "Global Active Power")
   
  # Close output device
  dev.off()
  
  setwd(originawd)
}