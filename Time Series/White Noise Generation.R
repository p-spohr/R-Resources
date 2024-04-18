set.seed(4567)
wn1 <- rnorm(500, 0, 1)
wn2 <- rnorm(500, 0, 1)

par(mfrow = c(2,1), mar = c(3,2,1,0) + 0.5, mgp = c(1.6, 0.6, 0))

plot.ts(wn1, main = "Zwei Pfade eines Gaußschen White Noise")
plot.ts(wn2)

par(mfrow = c(1,1))

# generate white noise with drift (Erwartungswert nicht gleich Null)
mu_vector <- seq(1, 500, 1)/200
std_vector <- rep(0.5, 500)
wn3 <- rnorm(500, mu_vector, std_vector)
plot.ts(wn3)


?cumsum

x1 <- rnorm(200, 0, 1)
x2 <- rnorm(200, 0.3, 1)
rw1 <- cumsum(x1)
rw2 <- cumsum(x2)

t <- seq(0, 200, 1)
plot.ts(0 * t, ylim = c(-20, 60), lty= 2, main= "Random Walk mit und ohne Drift")
lines(rw1, col= "red") # ohne Drift
lines(0 * t, col= "red", type= "l", lty= 2)
lines(rw2, col= "blue") # mit Drift
lines(0.3 * t, col= "blue", type= "l", lty=2)


