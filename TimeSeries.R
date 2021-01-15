library(data.table)
library(dplyr)
library(lubridate)
library(magrittr)
library(fpp2)
library(GGally)
library(urca)


cleaned=copy(BF_Cleaned_N_)

setDT(cleaned)

names(cleaned)
NEW= cleaned[ , sum(CANCELLED), by= .(OP_CARRIER,month = month(as.Date(cleaned$FL_DATE)),year=year(as.Date(cleaned$FL_DATE)))]

AA_NEW= NEW[OP_CARRIER == 'AA']
AA_NEW<- AA_NEW[ , -c(1)]
class(AA_NEW)

#convert to a time series
aa <- ts(data=AA_NEW$V1, frequency=12, start=c(2014,1), end=c(2018,12))

#plot the time series
autoplot(aa) + xlab("Year") + ylab("Number of Cancellations")+ scale_x_continuous(breaks = scales::pretty_breaks(n = 10)) +ggtitle("Timeseries plot of Cancellation of American Airlines 2014-2018") 

#Seasonal plot
ggseasonplot(aa, year.labels = TRUE, year.labels.left = TRUE) + ylab("Number of Cancellations") + xlab(" Dates across year") + ggtitle("Seasonality plot of Cancellation of American Airlines 2014-2018")

#forecast for next 5 months using meanf 
meanf(aa, h=5)

#forecast for next 5 months using naive method
naive(aa, h=5)

#forecast for next 5 months using snaive method
snaive(aa, h=5)

#Test for Stationary Data || not

Test=ur.kpss(aa)
summary(Test)
# Data is stationary as the value of t-stat < 1% wehich means that the null hypothesis is NOT rejected.

#Trend Cycle Component
fit1 = stl(aa, s.window = 5)
plot(aa, col="gray", main="Trend cycle component", ylab="Number of Cancellation", xlab="Year")
lines(fit1$time.series[,2], col="red", ylab="trend")


#Best fit arima model
auto.arima(aa)

#ARIMA
fit1= Arima(aa, order=c(1,0,0))
Az=forecast(fit1,h=10)
plot(aa, col="blue",main="ARIMA model forecast of AMERICAN AIRLINES", xlab="Years", ylab="Number of Cancellations")
lines(fitted(fit1), col="red")
lines(Az$mean, col="black")
summary(fit1)

