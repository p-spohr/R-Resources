# Datenstrukturen und Schleife

rm(list = ls())

# Vektoren ####
V <- as.character(c(1,2,3))
class(V)
class(c(1,2,3))

1:5

1:3 == (1:3)

c(1,5,3) == 1:3

c(1,2,3) + 2
c(1,2,3) - 2
c(1,2,3) / 2
c(1,2,3) * 2

exp(c(1,2,3))
sin(c(1,2,3))
log(c(1,2,3))
max(c(1,2,3))
min(c(1,2,3))


c(1,1,1) + c(1,1,1)
c(1,1,1) - c(1,1,1)
c(1,1,1) / c(1,1,1)
c(1,1,1) * c(1,1,1)
c(1,1,1) + c(1,1) # ERROR length is not the same

is.character(c(1,2,"3"))

as.numeric(c(1,2,"3")) * 2

class(c(1,2,"3")) # !!!VORSICHTIG!!!

neu_vect <- vector('numeric') # oder 'character

?append
append(neu_vect, c(-1, 10, 7))

vect <- c(1,2,3)
vect <- c(vect, 4:6)
vect
length(vect)

# erzeugen Sie Vektoren
1:5
?seq
seq(1,5,1)

rep(-1.3, 10)

# werfen Sie einen Würfel
# Gleichverteilung
?runif

# Random, Zufallsvariablen
runif(10, min = -10, max = 10)

round(runif(100, min = 1, max = 6))

round(floor(runif(5, min = 1, max = 6)))
rep(1/6, 6)
sample(seq(1,6), 5, replace = TRUE, prob = rep(1/6, 6))

namen <- c('Jim', 'Thorsten', 'Tina', 'Philip')
sample(namen, 30, replace = TRUE, prob = c(0.45, 0.25, 0.25, 0.05))

# Vektor Indexieren
vect2 <- seq(-5, 5, 1)
length(vect2)
vect2[c(1,5,11)]
range(vect2)

vect2[1:1]
vect2[-1:-5]

names <- c('Thorsten', 'Helena', 'Kris', 'Franky')
names[c(1,4)]
names[-c(1,4)]

'Helena' %in% names
'Kristina' %in% names

# Mengenoperatoren
union(1:5, 3:8)
union(1:5, 10:15)

intersect(1:5, 3:8)
intersect(-5:0, 0:5)

setdiff(1:5, 3:8)
setequal(1:5, 3:8)
is.element(1:5, 3:8) # returns logical vector

append(1:3, 4) # add 4 to end of list
append(1:3, 4, after = 0) # add 4 to beginning of list

# Matrix ####
A <- matrix(5, nrow = 3, ncol = 3) ; A
?matrix
B <- matrix(c(1,2,3), nrow = 3, ncol = 3) ; B
C <- matrix(c(1,2,3), nrow = 3, ncol = 3, byrow = TRUE) ; C

d <- seq(1,9)
D <- matrix(d, nrow = 3, ncol = 3, byrow = TRUE) ; D

A
cbind(A, c(1,2,3))
rbind(A, c(1,2,3))
?rbind

# matrix operations
N <- matrix(1, nrow=2, ncol = 2) ; N
N + N
N - N
N / N

N * N # Elementwise multiplication


N %*% N # Matrix multiplication

N * N == N%*%N # ALLE FALSCH

N + 2 # scalar operations work just like vectors
N - 2
N / 2
N * 2

M <- matrix(1:9)
dim(M) # [1] 9 1
M.T <- t(M) # transpose matrix
dim(M.T) # [1] 1 9

# lineares Gleichungssystem (LGS)
D <- D - matrix(runif(9, min = 1, max = 4), ncol = 3)
ds <- c(1, 2, 0)
solve(D, ds)

# Schleife ####


vect_zahl <- 1:10
vect_zahl * 2
vect_verdopp <- vector('numeric')

for (n in vect_zahl) {
  vect_verdopp <- append(vect_verdopp, n * 2)
}
vect_verdopp

i <- 1
for (n in vect_zahl) {
  vect_verdopp[i] <- n * 2
  i <- i + 1
}
vect_verdopp

names2 <- append(names, c('Abdul', 'Marry', 'Zoya'))
names2

for (name in names2) {
  print(name)
}

j <- 1
for (j in 1:length(names2)) {
  print(names2[j])
}

for (name in names2) {
  begruessung <- paste0(name, ' sagt Hallo!')
  begruessung
  print(begruessung)
}

N <- 5
for (i in 1:N) {
  print(i * 2)
}

j <- 0
while (j < 10) {
  print(j)
  j <- j + 1
}

# Filmresenzionen Beispiel ####
movie_ratings <- runif(10, min = 0, max = 5)
movie_ratings <- round(movie_ratings)

print(movie_ratings)

movie_ratings > 5
movie_ratings < 2
movie_ratings[movie_ratings > 3]
movie_ratings[movie_ratings < 2]

any(movie_ratings < 0) # [1] FALSE
any(movie_ratings > 5) # [1] FALSE
any(movie_ratings > 3) # [1] TRUE

is.null(movie_ratings)
is.na(movie_ratings) # all false because none are NA

test_null <- NULL
is.null(test_null) # [1] TRUE

is.numeric(movie_ratings) # [1] TRUE
is.character(movie_ratings) # [1] FALSE

movie_quality <- vector('character')
# changing the rating system from a qualitative to a quantitative one
for (rating in movie_ratings) {
  if (rating < 2) {
    movie_quality <- append(movie_quality, 'disliked') # make sure to assign!
  } else if ( rating >=2 && rating < 4) {
    movie_quality <- append(movie_quality, 'enjoyed')
  } else {
    movie_quality <- append(movie_quality, 'liked')
  }
}
movie_quality


# Breadworld Dataframe Beispiel ####

breadworld.names <- c("Tom", "Carly", "Jane", "Juan", "Bill")
breadworld.salaries <- c(55000, 60000, 80000, 60000, 45000)

## Slicing (Indizieren)
breadworld.names[1] 
breadworld.names[1:1]

breadworld.names[1:3]

breadworld.names[5]
breadworld.names[6]

breadworld.names[-2]
breadworld.names[-1:-3]

breadworld.names[1:3]

## Creating named vector
names(breadworld.salaries) <- breadworld.names
breadworld.salaries

breadworld.salaries["Bill"]
breadworld.salaries[5]

## Dataframe

bw_df <- data.frame(name = breadworld.names, salary = breadworld.salaries)
bw_df
rownames(bw_df) <- seq(1,nrow(bw_df))

nrow(bw_df)
ncol(bw_df)

bw_df$age <- floor(runif(nrow(bw_df), min = 20, max = 70))
bw_df

colnames(bw_df) <- c('Name', 'Salary', 'Age')
bw_df

## Liste kann mehr als eins Datentypen erhalten

meine_liste = bw_df[1,]
meine_liste
meine_liste$name
meine_liste['name']
meine_liste[1]

## Analyzing some observations
mean(breadworld.salaries)

breadworld.salaries > mean(breadworld.salaries)
greater.mean <- breadworld.salaries > mean(breadworld.salaries) ; greater.mean
breadworld.salaries[greater.mean]

# do it all in one line
breadworld.salaries[breadworld.salaries > mean(breadworld.salaries)]



