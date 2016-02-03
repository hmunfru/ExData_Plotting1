plotSubMetering <- function() {
  with(data, 
       plot(DateTime, Sub_metering_1, type='l', xlab='', ylab="Energy sub metering"))
  points(data$DateTime, data$Sub_metering_2,  type='l', col="red")
  points(data$DateTime, data$Sub_metering_3,  type='l', col="blue")
  legend("topright", col=c("black", "blue", "red"), legend=c("sub metering 1", "sub meterin 2", "sub metering 3"), lwd='1')
}
data <- getData()
print('Running plot3')
png('plot3.png', width=480, height=480, bg='transparent')
plotSubMetering()
dev.off()
