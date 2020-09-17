#Obtain data

NEI <- readRDS("~/DataScience/CourseraDS/CursoR/Data/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/DataScience/CourseraDS/CursoR/Data/exdata_data_NEI_data/Source_Classification_Code.rds")

# 2 Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#   (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot 
#   answering this question. Plot only fips = “24510”, time on x axis

baltimore <- subset(NEI, fips=="24510")
agg <- aggregate(Emissions ~ year, baltimore, sum)
clrs <- c("purple", "green", "blue", "yellow")

barplot(
  agg$Emissions,
  names.arg=agg$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  ylim=c(0,3500),
  main="Total PM2.5 Emissions - Baltimore City, MD",
col=clrs)
dev.off()

png("plot2.png", width=480, height=480)
