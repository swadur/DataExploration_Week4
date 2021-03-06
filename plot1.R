## Week 4 - Programming Assignment - Exploratory Data
## Suleman Wadur

## Load needed libraries
library(dplyr)


## Set working directory
workdir <- "C:/Move 4/Coursera/DataScience/Course4-ExploratoryDataAnalysis/Week4/Assignment"
setwd(workdir)


fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile="./exdata_data_NEI_data.zip")

unzip(zipfile="./exdata_data_NEI_data.zip", exdir=".")

if(!file.exists("summarySCC_PM25.rds") || !file.exists("Source_Classification_Code.rds")) {
  stop("One of the input files is missing!")
}

## Read data from the two files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Summarize emissions by year
data0 <- aggregate(NEI$Emissions, by=list(Year=NEI$year), FUN=sum)

## Plot totals by year using a line graph
plot(data0$Year, data0$x, type = "l", xlab = "Year", ylab = "Emissions in tons", main = "U.S. PM2.5 Total Emissions by Year")
