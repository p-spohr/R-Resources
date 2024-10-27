
A <- matrix(c(0.2, 0.3, 0.5, 0.3, 0.5, 0.2, 0.7, 0.2, 0.1), ncol = 3, byrow = TRUE)
B <- A
apply(B, 1, sum) # each row should add up to 1

A %*% A

for (i in 1:10) {
  
  B <- B %*% B
  
}

B # the probability converges as t ----> Inf


A_1 <- matrix(c(0.98, 0.01, 0.01, 0.3, 0.5, 0.2, 0.7, 0.2, 0.1), ncol = 3, byrow = TRUE)
C <- A_1
apply(C, 1, sum) # each row should add up to 1


for (i in 1:10) {
  
  C <- C %*% C
  
}

C  # the probability converges as t ----> Inf

matrix(c(1,0,0), ncol = 3, byrow = TRUE) %*% C  
