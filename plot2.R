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

## Get all Baltimore data. Its FIPS is 24510
data0 <- subset(NEI, fips == "24510")

## Summarize emissions by year
data0 <- aggregate(data0$Emissions, by=list(Year=data0$year), FUN=sum)

## Plot totals by year using a line graph
plot(data0$Year, data0$x, type = "l", xlab = "Year", ylab = "Emissions in tons", main = "Baltimore City PM2.5 Total Emissions by Year")


