#Obtain data

NEI <- readRDS("~/DataScience/CourseraDS/CursoR/Data/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("~/DataScience/CourseraDS/CursoR/Data/exdata_data_NEI_data/Source_Classification_Code.rds")

# Library

library(ggplot2)

# 3 Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#   variable, which of these four sources have seen decreases in emissions from 1999–2008 for 
#   Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2.
#   similar to 1, plot each type with time on x axis

# subset only Baltimore City, MD
# year needs to be factored for plot labels
baltimore <- subset(NEI, fips=="24510")
baltimore$year <- as.factor(baltimore$year)
agg <- aggregate(Emissions~(year+type), baltimore, sum)

# all on one graph
#ggplot(data=baltimore, aes(fill = type, y=Emissions, x=year)) + 
#  geom_bar(position="dodge", stat="identity")

# facet for each source type
ggplot(data=agg, aes(fill = type, y=Emissions, x=year)) + 
  geom_bar(stat="identity") +
  facet_wrap(~type) +
  ggtitle("Total PM2.5 Emissions - Baltimore City, MD", subtitle = "By Source Type") +
  labs(x = "Year", y = "PM2.5 Emissions (10^6 Tons)")
dev.off()


png("plot3.png", width=480, height=480)
