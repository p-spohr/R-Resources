# Autocovariance ARMA(1;1) Process

n <- 5000
phi <- 0.3
theta <- 0.5

arma <- arima.sim(list(ar = c(phi), ma = c(theta)), n = n)

arma_acf <- acf(arma, type = 'covariance')

arma_acf$acf[1]
var(arma)

var_eps <- 1

arima(arma, order = c(1, 0, 1))


acf_tau_0 <- phi * arma_acf$acf[2] + var_eps + phi * theta * var_eps + (theta ** 2) * var_eps 
acf_tau_0
arma_acf$acf[1]

acf_tau_0_v2 <- var_eps * (1 + ((phi + theta)**2 / (1 - phi**2)))
acf_tau_0_v2

acf_tau_1 <- phi * arma_acf$acf[1] + theta * var_eps
acf_tau_1
arma_acf$acf[2]

acf(arma, type = 'covariance')
acf(arma, type = 'correlation')

arma_acf$acf[1]
phi * arma_acf$acf[2] + 1.4 * var_eps

arma_acf$acf[2]
(arma_acf$acf[1] - 1.4 * var_eps) / phi

?rep

wn <- rnorm(5000)
X <- rep(5, 5000) 
# ARMA(1;3)
length(wn[1:47])
X_t <- X[3:4999] + wn[4:5000] + 0.5 * wn[3:4999] + 0.2 * wn[2:4998] + 0.05 * wn[1:4997]
plot(X_t, type = 'l')
arima(X_t, order = c(0, 0, 3)) # accurate theta predictions

