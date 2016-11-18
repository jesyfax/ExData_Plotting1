#R script for plot 3

library(dplyr)

power <-
  read.csv(
    "household_power_consumption.txt",
    sep = ";",
    header = TRUE,
    stringsAsFactors = FALSE,
    na.strings = "?"
  )
power_t <- tbl_df(power)

power_feb <- filter(power, Date %in% c("1/2/2007", "2/2/2007"))
power_feb$DateTime <-
  strptime(paste(power_feb$Date, power_feb$Time), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width = 480, height = 480)
plot(
  power_feb$DateTime,
  power_feb$Sub_metering_1,
  type = "l",
  ylab = "Energy sub metering",
  xlab = NA,
  col = "black"
)
lines(power_feb$DateTime, power_feb$Sub_metering_2, col = "red")
lines(power_feb$DateTime, power_feb$Sub_metering_3, col = "blue")
legend(
  "topright",
  lty = 1,
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
dev.off()