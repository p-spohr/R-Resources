
# generate random walk and regress x (time) onto y (sales)

# White Nose
n <- 10000
WN <- rnorm(n, mean=0, sd=1)
RW <- cumsum(WN)

t <- seq(1, n, 1)

plot(t, RW, type = "l")


?plot
?lm
linreg <- lm(RW ~ t)
summary(linreg)
pred <- predict(linreg)
class(pred)
lines(t, pred)

# residuals
RSS <- sum((RW - pred)^2) ; RSS
TSS <- sum((RW - mean(RW))^2) ; TSS

Rstat <- 1 - (RSS/TSS) ; Rstat

MSE <- mean((RW - pred)^2) ; MSE
sqrt(MSE)
