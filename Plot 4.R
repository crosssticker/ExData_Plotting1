y<-read.table("Test.txt", header = TRUE, sep = ";")
z<-rbind(subset(x, Date == "1/2/2007"), subset(x, Date == "2/2/2007"))
z<-transform(z, DateTime = paste(Date, Time))
z<-transform(z,DateTime = strptime(DateTime, "%d/%m/%Y %H:%M:%S"))
b<-c(0,40)
a<-range(z$DateTime)
c<-as.numeric(as.character(z$Sub_metering_1))
d<-as.numeric(as.character(z$Sub_metering_2))
e<-as.numeric(as.character(z$Sub_metering_3))
f<-as.numeric(as.character(z$Global_active_power))
g<-as.numeric(as.character(z$Global_reactive_power))
h<-as.numeric(as.character(z$Voltage))
s<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png(filename = "C:/R/Exploratory Data Analysis/Project 1/Plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(range(z$DateTime), range(f),xlab ="", ylab = "Global Active Power")
lines(z$DateTime, f, pch = "0")
plot(range(z$DateTime), range(h),xlab ="", ylab = "Voltage")
lines(z$DateTime, h, pch = "0")
plot(a,b, xlab = "", ylab = "Energy Sub Metering")
lines(z$DateTime, c , pch = "0")
lines(z$DateTime, d , pch = "0", col = "red")
lines(z$DateTime, e , pch = "0", col = "blue")
legend("topright", s, lty = 1, cex = 0.25, col = c("black", "red", "blue"))
plot(range(z$DateTime), range(g),xlab ="", ylab = "Global_reactive_power")
lines(z$DateTime, g, pch = "0")



dev.off()
