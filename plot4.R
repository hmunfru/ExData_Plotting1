source("plot2.R")
source("plot3.R")
source("utils.R")

data <- getData()
plotVoltage <- function(){
  with(data, {
    plot(DateTime, Voltage, xlab='datetime', type='l')
  })
}

plotGlobalReactivePower <- function(){
  with(data, {
    plot(DateTime, Global_reactive_power, xlab='datetime', type='l')
  })
}

print('Running plot4')
png('plot4.png', width=480, height=480, bg='transparent')
par(mfrow=c(2,2))
plotGlobalActivePower()
plotVoltage()
plotSubMetering()
plotGlobalReactivePower()
dev.off()
