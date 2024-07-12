# Difference filter

n <- 5000
wn <- rnorm(n)
mean(wn)
var(wn)

t <- seq(1, n, by=1)
plot(t, wn, type = "l")

rw <- cumsum(wn)
plot(t, rw, type = "l")
mean(rw)
var(rw)
rw[5000]


# autocovariance
autocov <- function(V, tau = 0) {
  tau <- abs(tau)
  V_1 <- V[1:(length(V)-tau)]
  V_2 <- V[(1+tau):length(V)]
  return(cov(V_1, V_2))
}

autocov(wn)


for (j in -2:2) {
  print(sprintf("tau is %i, autocov is %.4f", j, autocov(wn, j)))
}
# !!!!! paste, paste0, and sprintf need to be printed using print when in a loop

?diff

wn_diff_1 <- diff(wn, 1)
mean(wn_diff_1)
var(wn_diff_1)


for (j in -2:2) {
  print(sprintf("tau is %i, autocov is %.4f", j, autocov(wn_diff_1, j)))
}

ts.plot(wn_diff_1)

wn_diff_2 <- diff(wn, 2)
mean(wn_diff_2)
var(wn_diff_2)


for (j in -2:2) {
  print(sprintf("tau is %i, autocov is %.4f", j, autocov(wn_diff_2, j)))
}

ts.plot(wn_diff_2)
ts.plot(cumsum(wn))
ts.plot(cumsum(wn_diff_1))

twn <- rt(5000, 10)
ts.plot(cumsum(twn))
ts.plot(diff(twn,1))
mean(twn)
var(twn)
mean(diff(twn, 1))



