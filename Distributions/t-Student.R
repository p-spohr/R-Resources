# Autor: Manfred Jäger-Ambrozewicz
# jaegera@htw-berlin.de

rm(list = ls())
library(extraDistr)
df = 3
xachse <- seq(from = -5, to = 5, by = 0.01)
ywerte_t <- dlst(xachse,df,0,sqrt((df-2)/df))
# Diese Parameter führen zu einer t-Verteilung mit 
# einem Erwartungswert von 0 und einer Varianz von 1
# ... ist unübersichtlich ... to do!

var(rlst(10000000,df,0,sqrt((df-2)/df)))

ywerte_n <- dnorm(xachse,0,1)

par(mfrow=c(1,1))
plot(xachse, ywerte_t,
     type = "l",
     bty = "L")
lines(xachse, ywerte_n,col="green")

plot(xachse, ywerte_t,
     type = "l",
     xlim = c(-4,-2),
     ylim = c(0,0.04),
     bty = "L")
lines(xachse, ywerte_n,col="green")


