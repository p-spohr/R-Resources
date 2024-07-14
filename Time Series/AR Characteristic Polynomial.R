# AR Characteristic Polynomial

set.seed(1342)
z <- c(1, -1.3, 0.4)

a <- polyroot(z)

# first row rho(0) = 1 = C1 + C2
# second row rho(1) = C1 * (1/z1) + C2 * (1/z2)
# solving for C1 and C2 when the solution is 1 and phi_1 / (1 - phi_2)
K <- rbind(c(1,1), c(1/a[1], 1/a[2]))
b <- c(1, 1.3/(1 + 0.4))

C <- solve(K, b)

par(mfrow = c(2, 1), mar = c(3, 2, 1, 0) + 0.5, mgp = c(1.6, 0.6, 0))
x2 <- arima.sim(list(order = c(2, 0, 0), ar = c(1.3, -0.4)), n = 500)

plot.ts(x2, main = (expression(AR(2)~~~phi[1] == 1.3 ~~~phi[2] == -0.4)))
abline(h = 0, lty = 'dashed')
acf(x2)

?expression
?arima.sim

phi1 <- 0.3
phi2 <- 0.04

X <- c(1, -phi1, -phi2)
z2 <- polyroot(X)

K2 <- rbind(c(1, 1), c(1/z2[1], 1/z2[2]))
b2 <- c(1, phi1 / (1 - phi2))

C <- solve(K2, b2)
x3 <- arima.sim(list(ar = c(phi1, phi2)), n = 500)
plot.ts(x3)
acf(x3)

x3_acf <- acf(x3, type = 'correlation')
x3_acf <- x3_acf$acf

tau <- 0:25

rho <- 0.175 * ((-0.1) ** tau) + 0.825 * ((0.4) ** tau)


plot(x3_acf, pch = 'x')
lines(rho, type = 'p', col = 'red')

?lines
?acf
?plot

A <- matrix(c(1, 0.147, 0.094, 0.147, 1, 0.174, 0.094, 0.147, 1), nrow = 3, ncol = 3) ; A
A_inv <- solve(A) ; A_inv
rho_est <- matrix(c(0.147, 0.094, 0.384)) ; rho_est
A_inv %*% rho_est
