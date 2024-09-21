
?matrix
A <- matrix(c(1,0,0,1,1,0,1,1,1), nrow=3, ncol=3, byrow = TRUE) ; X

B <- 1:3

cumsum(B)
A %*% B

N <- matrix(rep(0,30), nrow=15, ncol=15) ; N


# create a matrix for calculating cumulative sums
for (i in 1:15) {
  for (j in 1:15){
    if (i >= j) {
      N[i,j] <- 1
    }
  }
}
N

N %*% 1:15
