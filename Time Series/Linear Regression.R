# linear regression on white noise

n <- 1000
t <- seq(1, n, 1)
wn <- rnorm(n, 0, n)

rw <- cumsum(wn)

plot(rw, type = 'l')


# linear regression with t to power 1
lin_reg_1 <- lm(rw ~ t)

class(lin_reg_1)
summary(lin_reg_1)

lin_reg_1$coefficients

plot(lin_reg_1$residuals, type = 'l')
plot(lin_reg_1$effects, type = 'l')
plot(lin_reg_1$fitted.values, type = 'l')

plot(rw, type="l", col = 'black')
lines(lin_reg_1$fitted.values, col="red") 
lines(lin_reg_1$coefficients[2]*t, col="blue") 
legend("topleft", 
       legend=c("Random Walk", "Modell", "Echter Trend"), 
       col=c("black","red", "blue"), 
       lty= c(1,1,1), cex=0.8)


# linear regression with t to order 1
t_2 <- t**2
lin_reg_2 <- lm(rw ~ t + t_2)

class(lin_reg_2)
summary(lin_reg_2)

lin_reg_2$coefficients

plot(lin_reg_2$residuals, type = 'l')
plot(lin_reg_2$effects, type = 'l')
plot(lin_reg_2$fitted.values, type = 'l')

plot(rw, type="l", col = 'black')
lines(lin_reg_2$fitted.values, col="red") 
lines(lin_reg_2$coefficients[2]*t + lin_reg_2$coefficients[3]*t_2, col="blue") 
legend("topleft", 
       legend=c("Random Walk", "Modell", "Echter Trend"), 
       col=c("black","red", "blue"), 
       lty= c(1,1,1), cex=0.8)


# linear regression with t to order 3
t_2 <- t**2
t_3 <- t**3
lin_reg_3 <- lm(rw ~ t + t_2 + t_3)

class(lin_reg_3)
summary(lin_reg_3)

lin_reg_3$coefficients

plot(lin_reg_3$residuals, type = 'l')
plot(lin_reg_3$effects, type = 'l')
plot(lin_reg_3$fitted.values, type = 'l')

plot(rw, type="l", col = 'black')
lines(lin_reg_3$fitted.values, col="red") 
lines(lin_reg_3$coefficients[2]*t + 
      lin_reg_3$coefficients[3]*t_2 +
      lin_reg_3$coefficients[4]*t_3,
      col="blue") 
legend("topleft", 
       legend=c("Random Walk", "Modell", "Echter Trend"), 
       col=c("black","red", "blue"), 
       lty= c(1,1,1), cex=0.8)


# linear regression with t to order 4
t_2 <- t**2
t_3 <- t**3
t_4 <- t**4

lin_reg_4 <- lm(rw ~ t + t_2 + t_3 + t_4)

class(lin_reg_4)
summary(lin_reg_4)

lin_reg_4$coefficients

plot(lin_reg_4$residuals, type = 'l')
plot(lin_reg_4$effects, type = 'l')
plot(lin_reg_4$fitted.values, type = 'l')

plot(rw, type="l", col = 'black')
lines(lin_reg_4$fitted.values, col="red") 
lines(lin_reg_4$coefficients[2]*t + 
      lin_reg_4$coefficients[3]*t_2 +
      lin_reg_4$coefficients[4]*t_3 +
      lin_reg_4$coefficients[5]*t_4,
      col="blue") 
legend("topleft", 
       legend=c("Random Walk", "Modell", "Echter Trend"), 
       col=c("black","red", "blue"), 
       lty= c(1,1,1), cex=0.8)




residuals_rss <- list(lin_reg_1$residuals, lin_reg_2$residuals, lin_reg_3$residuals, lin_reg_4$residuals)
tss <- sum((rw - mean(rw))**2)

rss <- function(x) {
  x_hat <- mean(x)
  sum((x - x_hat)**2)
}

# need double bracket to access vector in list
matrix(residuals_rss[[4]])[1:5]
class(matrix(residuals_rss[[1]]))

results <- vector(mode = 'numeric')
?vector

for (res in residuals_rss) {
  res_mat <- matrix(res)
  results <- append(results, apply(res_mat, 2, rss))
}

results

for (res in residuals_rss) {
  print(apply(res, 2, rss))
}

R_2 <- vector(mode = 'numeric')

# create R squared quality measure (closer to 1 is better)
for (rss in results) {
  R_2 <- append(R_2, 1 - rss/tss)
}

R_2

?apply

add_one <- function(x) {x+1}
A <- matrix(1:10, nrow = 5, ncol = 2)

apply(A, 2, add_one)

