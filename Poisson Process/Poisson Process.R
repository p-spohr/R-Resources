
?rpois

n <- 10000
lambda_1 <- 2
lambda_2 <- 4

P1 <- rpois(n, lambda_1)
P2 <- rpois(n, lambda_2)

mean(P1)
mean(P2)

P3 <- P1 + P2
mean(P3)
