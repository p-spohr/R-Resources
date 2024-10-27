setwd("C:/Users/pat_h/OneDrive/public-repos/R-Resources/Value at Risk")

stocks <- read.csv("stocks.csv")
head(stocks)
par(mfrow=c(3,1), mai=c(0.3,0.55,0,0))
plot(stocks[,1], type='l', ylab = 'A')
plot(stocks[,2], type='l', ylab = 'B')
plot(stocks[,3], type='l', ylab = 'C')

stock_log <- log(stocks)
stock_log_ret <- apply(stock_log, 2, diff)
# ?apply

par(mfrow=c(3,1), mai=c(0.3,0.55,0,0))
plot(stock_log_ret[,1], type='l', ylab = 'A')
plot(stock_log_ret[,2], type='l', ylab = 'B')
plot(stock_log_ret[,3], type='l', ylab = 'C')

#### Value at Risk of Stock A ####
port_val <- 1000

A_stock_L <- -stock_log_ret[,1] # NEED LOSS NOT RETURNS
A_stock_L <- sort(A_stock_L, decreasing=FALSE) 
# ?sort
A_stock_L

# alpha = 0.99
# all to the right of 1 - alpha on the density function is considered the Value at Risk
alpha <- 0.99
nalpha <- ceiling(length(A_stock_L) * alpha) # index of vector with 99%-VaR
A_VaR <-  A_stock_L[nalpha] ; A_VaR

# portfolio VaR for A Stock
A_VaR * port_val
# same VaR when quantile function is used
quantile(A_stock_L, p = 0.99, type=1) * port_val
# ?quantile

# Normal Distribution
A_mu <- mean(A_stock_L)
A_sigma <- sd(A_stock_L)

# VaR if losses are normal-distributed
A_VaR_Normal <- (A_mu + A_sigma * qnorm(alpha)) * port_val

# t-Distribution
# install.packages('QRM')
library(QRM)
?fit.st
model_t <- fit.st(A_stock_L)
model_t$par.ests

# VaR if losses are t-distributed
A_VaR_t <-  (model_t$par.ests["mu"] + 
              model_t$par.ests["sigma"] * 
               qt(alpha, df = model_t$par.ests["nu"])) * port_val
A_VaR_t

#### Expected Shortfall of Stock A ####
A_ES <- mean(A_stock_L[A_stock_L > A_VaR]) * port_val
A_ES


integrand = function(q){q * dnorm(q)}
N_ES <- (A_mu + A_sigma * integrate(integrand, qnorm(alpha), Inf)$value / (1-alpha)) * port_val
N_ES

#### VaR of entire A, B, and C stock portfolio ####
?data.frame
stock_weights <- data.frame(Weights = c(0.3, 0.2, 0.5), row.names = c('A', 'B', 'C'))
stock_weights
head(stock_log_ret)
# ?dim
dim(stock_weights)
dim(stock_log_ret)
head(stock_log_ret)

# L RV of weighted portfolio
ABC_weighted_ret <- as.matrix(stock_log_ret) %*% as.matrix(stock_weights)
head(ABC_weighted_ret)
ABC_weighted_L <- -ABC_weighted_ret
ABC_weighted_L <- sort(ABC_weighted_L)
VaR_index <- ceiling(length(ABC_weighted_L) * alpha)
ABC_VaR <- ABC_weighted_L[VaR_index]
ABC_VaR * port_val
quantile(ABC_weighted_L, alpha, type = 1) * port_val

ABC_mu <- mean(ABC_weighted_L)
ABC_sigma <- sd(ABC_weighted_L)

# VaR of weighted portfolio if losses are normal-distributed
ABC_VaR_Norm <- (ABC_mu + ABC_sigma * qnorm(alpha)) * port_val

# VaR of weighted portfolio if losses are t-distributed
t_mod_ABC <- fit.st(ABC_weighted_L)

ABC_VaR_t <- (t_mod_ABC$par.ests['mu'] + 
                t_mod_ABC$par.ests['sigma'] * qt(alpha, t_mod_ABC$par.ests['nu'])) * port_val
as.numeric(ABC_VaR_t)
