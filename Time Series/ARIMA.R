# Simulate ARIMA

install.packages("astsa")
library(astsa)

?arima.sim
?arima

?list

set.seed(5)

test_model_1 <- list(order=c(3, 0 , 0), ar=c(0.5, 0.4, 0)) ; test_model_1

test_model_2 <- list(ar=c(0, 0.4, 0), ma=c(0, 0.4, 0)) ; test_model_2

arima_1 <- arima.sim(test_model_1, 200)
arima_2 <- arima.sim(test_model_2, 200)

arima(arima_1, order= c(3, 0, 0))
arima(arima_2, order= c(3, 0, 3))

?acf

acf(arima_1)
acf(arima_2)

pacf(arima_1)
pacf(arima_2)

ts.plot(arima_1)
ts.plot(arima_2)


x <- rnorm(150) # erzeuge White Noise (150 iid N(0,1)-Variablen) 
?sarima
sarima(xdata=arima_1, p=3, d=0, q=0, details=F)
sarima(xdata=arima_2, p=3, d=0, q=3, details=F)

?matrix
I <- diag(1, 3, 3)

M <- matrix(c(1,2,3,5,5,6,7,8,9), nrow= 3, ncol = 3, byrow = TRUE)
M_s <- solve(M)
round(M %*% M_s, 3)
?round
A <- matrix(1:4, 2, 2, byrow= TRUE)
A_s <- solve(A)
round(A %*% A_s, 3)


