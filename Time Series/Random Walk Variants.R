# Random Walk Variants

rw_variant <- rnorm(50, 0, 1)
rw_variant <- abs(rw_variant)
rw_variant <- cumsum(rw_variant) + rnorm(50, 0, 5)
plot(rw_variant, type = 'l')

Y <- rep(0, 100)

for (i in 2:100) {
  Y[i] <- 0.9 * Y[i-1] + rnorm(1, 0, i)
}

plot(Y, type = 'l')
