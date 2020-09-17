## Move files to directory to read data

NEI <- readRDS("~/DataScience/CourseraDS/CursoR/Data/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/DataScience/CourseraDS/CursoR/Data/exdata_data_NEI_data/Source_Classification_Code.rds")

# 1 Have total emissions from PM2.5 decreased in the United States from 
#   1999 to 2008? Using the base plotting system, make a plot showing the 
#   total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#   subset 1999 to 2008 data, make lines to show each year 

total_emmissions <- aggregate(Emissions ~ year, NEI, sum)


barplot(
  (total_emmissions$Emissions)/10^6,
  names.arg=total_emmissions$year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  ylim = c(0, 7.5),
  main="Total PM2.5 Emissions - All United States")

png("plot1.png", width=480, height=480)
dev.off()

