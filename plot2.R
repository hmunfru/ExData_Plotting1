plotGlobalActivePower <- function(){
  with(data, 
       plot(DateTime, Global_active_power,  type='l', xlab='', 
            ylab="Global Active Power (kilowatts)"))
}

data <- getData()
print('Running plot2')
png('plot2.png', width=480, height=480, bg='transparent')
plotGlobalActivePower()
dev.off()
