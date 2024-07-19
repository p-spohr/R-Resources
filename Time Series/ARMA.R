# ARMA

arma <- arima.sim(list(ar = c(0.1, -0.3), ma = c(0.1, 1.6)), n = 1000)
plot(arma, type = 'l')
