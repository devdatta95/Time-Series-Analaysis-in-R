library(forecast)
library(tseries)
skirts <- read.csv(file.choose()) #skirts.csv
class(skirts)
skirtsseries <- ts(skirts, frequency = 12, start = c(2014,1))
plot.ts(skirtsseries)
skirtsseries<-log(skirtsseries)
skirtsseriesforecasts <- HoltWinters(skirtsseries, gamma=FALSE)
skirtsseriesforecasts
skirtsseriesforecasts$SSE
exp(skirtsseriesforecasts$SSE)
plot(skirtsseriesforecasts)
skirtsseriesforecasts2<- forecast(skirtsseriesforecasts, h=6)
plot(skirtsseriesforecasts2)
Box.test(skirtsseriesforecasts2$residuals, lag=20, type="Ljung-Box")
plot.ts(skirtsseriesforecasts2$residuals)
accuracy(skirtsseriesforecasts2)
