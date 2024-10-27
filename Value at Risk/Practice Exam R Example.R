
L <- c(4, 1, 2, 5, 7, 8, 4, 8, 6 ,3, 1, 1)
alpha <- 0.7

sort(L)

L_sorted <- sort(L)
L_sorted[ceiling(length(L_sorted) * alpha)]

ecdf_fun <- ecdf(L)
par(mfrow = c(1,1), mai = c(0.5, 0.5, 0.5, 0.5))
plot(ecdf_fun,
     main = 'Emp DF',
     xlab = 'L',
     ylab = 'F_L')

lines(c(-2, 10), c(alpha, alpha), col = 'red', lwd = '2')

VaR <- as.numeric(quantile(L, alpha, type = 1))

ProbCond <- sum(L > VaR) / length(L)

gamma <- ProbCond / (1 - alpha)

mean(L[L > VaR])

ES <- gamma * mean(L[L > VaR]) + (1-gamma) * VaR

# 73%-VaR
lines(c(-2, 10), c(0.73, 0.73), col = 'blue', lwd = '2')
L[ceiling(length(L) * 0.73)]

plot(ecdf_fun(L), L)
abline(v= 0.73)

mean(L[L > VaR])
ecdf_fun(6)

