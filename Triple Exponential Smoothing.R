souvenir <- read.csv(file.choose()) #souvenir.csv
class(souvenir)
souvenirimeseries <- ts(souvenir, frequency=12, start = c(2009,1))
souvenirimeseries 
plot.ts(souvenirimeseries)
logsouvenirtimeseries <- log(souvenirimeseries)
plot.ts(logsouvenirtimeseries)
souvenirimeseriesforecasts <- HoltWinters(logsouvenirtimeseries)
souvenirimeseriesforecasts
souvenirimeseriesforecasts$SSE
exp(souvenirimeseriesforecasts$SSE)

plot(souvenirimeseriesforecasts)
souvenirimeseriesforecasts2 <- forecast(souvenirimeseriesforecasts,h=36)
plot(souvenirimeseriesforecasts2)
Box.test(souvenirimeseriesforecasts2$residuals, lag=20, type = "Ljung-Box")
plot.ts(souvenirimeseriesforecasts2$residuals)
accuracy(souvenirimeseriesforecasts2)

