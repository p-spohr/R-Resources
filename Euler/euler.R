kappa <- 0.4
theta <- 0.03
sigma <- 0.02
r0 <- 0.025

delta_t = 1 / 365

set.seed(123)

par1 <- theta * (1 - exp(-kappa * delta_t))
par2 <- sqrt(sigma^2 / (2 * kappa) * (1 - exp(-2 * kappa * delta_t)))
par3 <- exp(-kappa * delta_t)

r = numeric(366)
r[1] = r0

for (i in 2:366) {
  r[i] <- rnorm(1, par3 * r[i-1] + par1, par2)
}

plot(r, type='l')