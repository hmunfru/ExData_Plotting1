# install dependences
#to read tables

installPackages <- function () {
  if (!require("data.table")) {
    install.packages("data.table")
  }
  if (!require("sqldf")) {
    install.packages("sqldf")
  }
  
  require("data.table")
  require("sqldf")
}

downloadFile <- function (url, zipFile) {
  if(!file.exists(zipFile)){
    #download file. Try default method first. If that fails (e.g. for https and linux), try wget.
    tryCatch(
      download.file(url, destfile=zipFile)
      , error = function(e){
        download.file(url, destfile=zipFile, method='wget')
      }
    )
  }
  unzip(zipFile)
}

getData <- function() {
  installPackages()
  url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  file <- 'household_power_consumption.txt'
  zipFile <- 'exdata-data-household_power_consumption.zip'
  
  # filter the data to be obtained by Date
  sql <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
 
  # Read file into data object
  if (!file.exists(file)) {
     downloadFile(url, zipFile)
  }
  data <- read.csv.sql(file, sql, sep=';'
                       ,header=T)
  dataTime <- paste(data$Date, data$Time, sep=' ')
  data$DateTime<- strptime(dataTime, format="%d/%m/%Y %H:%M:%S")
  data
}

