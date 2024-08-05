
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
