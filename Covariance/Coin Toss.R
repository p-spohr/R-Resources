
?sample

coin_toss <- sample(c(-1,1), 1000, replace = TRUE, prob = c(0.5, 0.5))

plot(coin_toss, type = 'l')

rw <- cumsum(coin_toss)

plot(rw, type = 'l')

var(rw)

cov(rw[1:999], rw[2:1000])

cov(rw[1:995], rw[6:1000])

acf(rw)

# length(rw[1:995])
# length(rw[6:1000])

mean(coin_toss)
var(coin_toss)

# Erwarungswert von coin_toss
((1 + 1) * 0.5) - 1
mean(coin_toss)

# Varaniz von coin_toss
(((1 + 1) ** 2) * 0.5) - 1
var(coin_toss)

# Erwarungswert von rw
((1 + 1) * 0.5 - 1) * 1000
mean(coin_toss) * 1000

x1_mean <- 5
x1_sd <- 1
X1_1 <- x1_mean + rnorm(1000, x1_mean, x1_sd)
X1_2 <- x1_mean + rnorm(1000, 0, x1_sd)
X1_3 <- rnorm(1000, x1_mean, x1_sd)

mean(X1_1)
mean(X1_2)
mean(X1_3)



