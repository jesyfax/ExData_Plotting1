#R script for plot 2

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
png("plot2.png", width = 480, height = 480)
plot(
  power_feb$DateTime,
  power_feb$Global_active_power,
  type = "l",
  ylab = "Global Active Power (kilowatts)",
  xlab = NA
)
dev.off()
