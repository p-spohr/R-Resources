# Ljung-Box Test

#### white noise test ####
?Box.test

n <- 10000
wn <- rnorm(n, 0, 1)

# large p-values => white noise is independently distributed, true for white noise
for (i in 1:10) {
  test <- Box.test(wn, i, type = 'Ljung-Box')
  print(paste0("Lag ", i, ": ", round(test$p.value, 4)))
}

wn_acf <- acf(wn, type = 'correlation')

tau <- 2:5
rho <- wn_acf$acf[2:5] ; rho
rho_test <- ( rho ** 2 ) / ( n - tau ) 

# test statistic is not larger than required chisq quantile => don't reject null hypothesis
n * (n+2) * sum(rho_test) > qchisq(0.95, length(tau))

n * (n+2) * sum(rho_test)
qchisq(0.95, length(tau))


#### random walk test ####

n1 <- 50
t <- 1:n1
wn1 <- cumsum(rnorm(length(t)))
plot(wn1, type = 'l')

# p-value very small => reject null hypothesis => random walk not independently distributed
for (i in 1:10) {
  test <- Box.test(wn1, i, type = 'Ljung-Box')
  print(paste0("Lag ", i, ": ", round(test$p.value, 4)))
}

wn1_acf <- acf(wn1, type = 'correlation')

tau1 <- 2:5
rho1 <- wn1_acf$acf[2:5] ; rho1
rho_test1 <- ( rho1 ** 2 ) / ( n1 - tau1 ) 

# test statistic is larger than required chisq quantile => reject null hypothesis
n1 * (n1+2) * sum(rho_test1) > qchisq(0.95, length(tau1))

n1 * (n1+2) * sum(rho_test1)
qchisq(0.95, length(tau1))
