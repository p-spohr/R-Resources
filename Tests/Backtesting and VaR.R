# Backtesting and VaR


p <- 9/600

?binom.test

binom.test(9, 600, p = 0.05, conf.level = 0.99, alternative = "greater")


# H_0: The probability of loss exceeding the 99%-VaR is smaller or equal to p 
# H_1: The probability of loss exceeding the 99%-VaR is greater than p

# when loss exceeded the 99%-VaR 10 times, is the null hypothesis not rejected
1 - pbinom(10, 600, prob = 0.01) # 0.042 is less than 0.05

# when loss exceeded the 99%-VaR 9 times, the null hypothesis is rejected
1 - pbinom(9, 600, prob = 0.01) # probability of 0.083 is greater than 0.05

