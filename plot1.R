source("utils.R")
data <- getData()
print('Running plot1')

#plot to png
png('plot1.png', width=480, height=480, bg='transparent')
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()

