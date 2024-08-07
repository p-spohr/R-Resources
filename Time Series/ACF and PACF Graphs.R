# ACF and PACF Graphs

# MA Process
n <- 1000
thetas = c(0.01, 0.9, 0.01, 0.8, 0.01, 0.9, 0.01)

ma_process <- arima.sim(list(ma = thetas), n = n)

par(mfrow = c(2,1), mai = c(0.45, 0.45, 0.1, 0.1))
acf(ma_process, main = "")
pacf(ma_process, main = "")

par(mfrow = c(1,1))
plot(cumsum(ma_process), type = 'l')

# AR Process
# sum of phis need to be less than 1
n1 <- 1000
phis = c(0.001, 0.001, 0.001, 0.001, 0.001, 0.8) / 6

ar_process <- arima.sim(list(ar = phis), n = n1)

par(mfrow = c(2,1), mai = c(0.45, 0.45, 0.1, 0.1))
acf(ar_process, main = "")
pacf(ar_process, main = "")

par(mfrow = c(1,1))
plot(cumsum(ar_process), type = 'l')

# ARMA Process
n2 <- 1000
thetas_1 = c(0.1, 0.1, 0.1, 0.1, 0.9)
phis_1 = c(0.1, 0.1, 0.1, 0.1, 0.1)

arma_process <- arima.sim(list(ar = phis_1, ma = thetas_1), n = n2)

par(mfrow = c(2,1), mai = c(0.45, 0.45, 0.1, 0.1))
acf(arma_process, main = "")
pacf(arma_process, main = "")

par(mfrow = c(1,1))
plot(cumsum(arma_process), type = 'l')

arima(arma_process, order = c(5, 0, 5))

?acf
?par
?plot.acf
?pacf
