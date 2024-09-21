
k <- seq(1, 30, 1)
prob_dist <- pbinom(k, 30, 0.6)
prob_den <- dbinom(k, 30, 0.6)


cumsum(round(prob_den, 15))
round(prob_dist, 10)
?pbinom

n <- seq(0, 5, 0.2)
p <- 0.25

a <- (1 - p) * (p**n)

plot(n, a, type='l')

?seq



x <- 1:1000
cumsum(p**x)
1/(1-p)

x_2 <- 0:1000
cumsum(p**x_2)
1/(1-p)

p * sum((1-p)**x_2)

sum(p ** x_2) * (1-p)
