#### Hidden Markov Chain Model ####
# By Prof Dr Hillebrand
# Stochastische Prozesse
# HTW Berlin

## packages herunterladen

install.packages("depmixS4")
library(depmixS4)

help(package = "depmixS4")


## Daten einlesen: DAX
daten <- read.csv("DAX.csv", header=T, sep=";", dec=",")
head(daten)
daten$Datum <- as.Date(daten$Datum, format = "%d.%m.%Y")
class(daten$Datum)

## Zeitindexmenge
t <- daten$Datum
r <- diff(log(daten$P))

train_zeitraum <- which((t > "1987-12-31") & (t < "2011-01-01"))
test_zeitraum <- which( t >= "2011-01-01")
?which

rtest <- r[test_zeitraum]
ttest <- t[test_zeitraum]
rtrain <- r[train_zeitraum]
ttrain <- t[train_zeitraum]

head(rtest)
head(rtrain)
head(ttest)
head(ttrain)

set.seed(1)

?depmix

prob <- function (x) {x / sum(x)}

hmm <- depmix(response = rtrain ~ 1, 
              data = data.frame(rtrain = rtrain),
              nstates = 2,
              family = gaussian(),
              trstart = apply(matrix(runif(4), 2) , 1, prob),
              respstart = matrix(c(0, sd(rtrain), 0, sd(rtrain)), 2),
              instart = prob(runif(2))
              )
hmm

# Modell fitten, Baum-Welch-Algorithmus = EM-Algorithmus

hmmfit <- fit(hmm, verbose = FALSE)
summary(hmmfit)


post_probs <- posterior(hmmfit, type = "viterbi")
plot(ttrain, cumsum(rtrain), type = "l", xlab = "Jahr")
points(ttrain, (post_probs$state - 1) * 2, col = "blue", type = "l")


n <- length(train_zeitraum)
zustand <- rep(0, n)
if (getmodel(hmmfit, which = "response")@parameters$coefficients 
    > getmodel(hmmfit, which = "response", 2)@parameters$coefficients ) {
  zustand[post_probs$state == 1] <- 1
} else{
  zustand[post_probs$state == 2] <- 2
}

summary(rtrain[zustand == 1])
summary((rtrain[zustand == 0]))

getmodel(hmmfit, which = "response")@parameters$coefficients
getmodel(hmmfit, which = "response", 2)@parameters$coefficients

sd(rtrain[zustand == 1])
sd(rtrain[zustand == 0])

plot(ttrain, cumsum(rtrain * zustand), type = "l")
points(ttrain, cumsum(rtrain), type = "l", col = "blue")

