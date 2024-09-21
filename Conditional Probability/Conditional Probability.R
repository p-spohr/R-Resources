

omega <- 1:6

X <- sample(omega, 10000, replace = TRUE, prob = rep(1,length(omega))/length(omega))
Y <- sample(omega, 10000, replace = TRUE, prob = rep(1,length(omega))/length(omega))

Z <- X + Y

omega_s <- 2:12
i <- 1
F_Z <- vector('numeric')
for (o in omega_s) {
  
  F_Z[i] <- sum(Z == o)/length(Z)
  i <- i+1
}

plot(omega_s, F_Z, type = 'h')

sum(Z >= 5 & Z <= 11) / length(Z)












?plot
hist(X, breaks = -1:6)
hist(Y, breaks = -1:6)

Z <- X + Y

sum(Z == 0)

H <- hist(Z, breaks = -2:13)

H

?freq
?hist

probs <- hist(Z, breaks = 1:12, freq = FALSE, include.lowest = TRUE)

probs

rep(1,11)


