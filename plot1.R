####################################################################################
# Function plot1() - Plots Frequency( Number of ocurrencies) of Global Active Power
# Author: Jorge Gervasio Pereira - Date : November 7th, 2015


plot1 <- function(){
  
  library(ggplot2)

  originawd <-getwd()
  
  setwd("C:/Users/USUARIO PC/Documents/Cousera-Exploratory-Data-Analytics")
  
  # Set output device ( file plot1.png)
  
  png(filename = "plot/plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white", res = NA, family = "", restoreConsole = TRUE,type = c("windows", "cairo", "cairo-png"))
  
  
  # Read text file as columns of strings
  df <- read.table("household_power_consumption.txt",sep = ";", header = TRUE,stringsAsFactors = FALSE)
  
  #subsetting dataframe by date using grep function
  
  df_sub1 <- df[grep("^1/2/2007", df$Date), ]
  
  df_sub2 <- df[grep("^2/2/2007", df$Date), ]
  
  df_feb_1_2 <- rbind(df_sub1,df_sub2)
  
  # Convert Global Active Power values from string representation to numeric values

  df_feb_1_2$Global_active_power <- as.numeric(df_feb_1_2$Global_active_power)
  
  # Plot output to plot1.png image file

  hist(df_feb_1_2$Global_active_power, col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab= "Frequency",border = "black")
  
  # Close output file
  
  dev.off()
  
  setwd(originawd)
}