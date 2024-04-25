#### Advanced Object Types ####

# vectors
c(1,2,3)
class(c(1,2,3))
1:3 == (1:3)
c(1,5,3) == 1:3

c(1,2,3) + 2 # scalar operations
c(1,2,3) - 2
c(1,2,3) / 2
c(1,2,3) * 2

c(1,1,1) + c(1,1,1) # vector operations
c(1,1,1) - c(1,1,1)
c(1,1,1) / c(1,1,1)
c(1,1,1) * c(1,1,1)
c(1,1,1) + c(1,1) # ERROR length is not the same


c(1,2,"3")
class(c(1,2,"3")) # !!!converted to character

# other vector operations
?union
union(1:5, 3:8)
intersect(1:5, 3:8)
setdiff(1:5, 3:8)
setequal(1:5, 3:8)
is.element(1:5, 3:8) # returns logical vector

?array
array(1:3, c(3,3)) # creates matrix

?append
append(1:3, 4) # add 4 to end of list
append(1:3, 4, after = 0) # add 4 to beginning of list

# matrix
A <- matrix(5, nrow = 3, ncol = 3) ; A
B <- matrix(c(1,2,3), nrow = 3, ncol = 3) ; B
C <- matrix(c(1,2,3), nrow = 3, ncol = 3, byrow = TRUE) ; C
d <- c(1,2,3,4,5,6,7,8,9)
D <- matrix(d, nrow = 3, ncol = 3, byrow = TRUE) ; D
?matrix

# matrix operations
?matrix
N <- matrix(1, nrow=2, ncol = 2) ; N
N + N
N - N
N / N
N * N # element wise multiplication
N %*% N # matrix multiplication
N * N == N%*%N # ALL FALSE

N + 2 # scalar operations work just like vectors
N - 2
N / 2
N * 2

M <- matrix(1:9)
dim(M) # [1] 9 1
M.T <- t(M) # transpose matrix
dim(M.T) # [1] 1 9
