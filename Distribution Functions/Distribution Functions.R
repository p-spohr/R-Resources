
X <- c(0,2,3,5,6)
P <- c(0, 0.1, 0.3, 0.2, 0.1, 0)

?stepfun

f_X <- stepfun(X,P, right = FALSE)
plot(f_X)

# vectorize function using for loop
F_X <- function(X) {
  
  i <- 1
  Z <- vector('numeric')
  
  for (x in X) {
    
    if (x < 0) {
      
      Z[i] <- 0
      
    } else if (x >= 0 & x < 2) {
      
      Z[i] <- 0.1 * x
      
    } else if (x >= 2 & x < 3) {
      
      Z[i] <- 0.3 * x - 0.4
      
    } else if (x >= 3 & x < 5) {
      
      Z[i] <- 0.2 * x - 0.1
      
    } else if (x >=5 & x < 6) {
      
      Z[i] <- 0.1 * x + 0.4
      
    } else {
      
      Z[i] <- 1
      
    }
    
  i <- i + 1
  
  }
  
  return(Z)

}

?Vectorize

x <- seq(0,6,0.1)
plot(x, F_X(x), type = 'l')

plot(F_X(x), x, type = 'l')


VaR_X <- function(X) {
  
  i <- 1
  Z <- vector('numeric')
  
  for (x in X) {
    
    if (x <= 0) {
      
      Z[i] <- 0
      
    } else if (x > 0 & x <= 0.2) {
      
      Z[i] <- 10 * x
      
    } else if (x > 0.2 & x <= 0.5) {
      
      Z[i] <- (10/3) * x + (4/3)
      
    } else if (x > 0.5 & x <= 0.9) {
      
      Z[i] <- 5 * x + 0.5
      
    } else if (x > 0.9 & x <= 1) {
      
      Z[i] <- 10 * x - 4
      
    } else {
      
      Z[i] <- 1
      
    }
    
    i <- i + 1
    
  }
  
  return(Z)
  
}

# simple reverse axis
plot(F_X(x), x, type = 'l')


# use VaR function
f <- seq(0,1,0.01)
plot(f, VaR_X(f), type = 'l')

matrix(f)
?apply
# must change vector into matrix when using apply
V <- apply(matrix(f), MARGIN = 1, FUN = VaR_X)
# margin 1 is for returning one row vector (apply over rows)
# margin 2 is for returning one column vector (apply over columns)


#### Monte Carlo Inversionsmethode ####

# generate uniformly distributed RV
U_u <- runif(10000)

# input uniformly distributed RV into VaR
Mont_Car <- apply(matrix(U_u), MARGIN = 1, FUN = VaR_X)

length(seq(0,1,0.01))


# plot hist and density function should be similar
par(mfrow = c(1,2))
hist(Mont_Car, freq = FALSE)
f_X <- stepfun(X,P, right = FALSE)
plot(f_X)


# rejection sampling

par(mfrow = c(1,1))

n = 1:10000
M = 1.5

plot(f_X(seq(0,6,0.1)))

S <- vector('numeric')

for (t in n) {
  
  y <- runif(1, 0, 6)
  u <- runif(1)
  
  while (M * u * dunif(y, 0, 6) >= f_X(y)) {
    
    y <- runif(1, 0, 6)
    u <- runif(1)
    
  }
  
  S[t] <- y
  
}


par(mfrow = c(1,2))
hist(S, freq = FALSE, ylim = c(0, 0.3))
plot(seq(0,6,0.1),
      f_X(seq(0,6, 0.1)), 
      type='l')



#### show the points on the density graph ####
n <- 10000
K <- runif(n+1, 0, 1)

plot(K)
plot(AX, f_X(AX), type='l', ylim=c(0,0.3))

AX <- seq(0, 6, (6/n))

L <- f_X(AX)

K[K > L] <- NA

plot(AX, K)


