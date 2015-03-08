y<-read.table("Test.txt", header = TRUE, sep = ";")
z<-rbind(subset(x, Date == "1/2/2007"), subset(x, Date == "2/2/2007"))
z<-transform(z, DateTime = paste(Date, Time))
z<-transform(z,DateTime = strptime(DateTime, "%d/%m/%Y %H:%M:%S"))
a<-as.numeric(as.character(z$Global_active_power))
png(filename = "C:/R/Exploratory Data Analysis/Project 1/Plot.png", width = 480, height = 480, units = "px")
hist(a, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()


