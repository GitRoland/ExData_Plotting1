## plot2.R: script to create 2nd of 4 plots for project #1, Exploratory Data Analysis class - 12/12/2005

#---- change to our local directory where data resides ----
setwd("c:\\coursera\\ExploratoryDataAnalysis")

#---- read the UCI household power data (4 years, 2 million rows, 9 cols) ----
cc =  c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df = read.csv("household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?", colClasses = cc)

#---- extract rows for Feb-1-2007 and Feb-2-2007 ----
df2 = rbind(df[df$Date == "1/2/2007",], df[df$Date == "2/2/2007",])

#---- combine date & time into a new column ----
dateTime = strptime(paste(df2$Date, df2$Time), "%d/%m/%Y %H:%M:%S")
df2 = cbind(dateTime, df2)

#---- pick a fun font to plot with ----
windowsFonts(A=windowsFont("Comic Sans MS"))

#---- build a line plot of df$Global_active_power over the 2 days ----
plot(df2$dateTime, df2$Global_active_power, type="n", main="Global Active Power", 
      ylab = "Global Active Power (kilowatts)", family="A", xlab="")
lines(df2$dateTime, df2$Global_active_power, type="l")

#---- copy screen plot to 480x480 PNG ----
dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off()

  