# Normalverteilung
# Autor: Manfred Jäger-Ambrozewicz

xAchse <- seq(from = -4, to = 4, by = 0.01)
DichteSN <- dnorm(xAchse,mean = 0, sd =1)  

plot(xAchse,DichteSN,
     bty = "L",
     type = "l",
     xlab = "x",
     ylab = "f",
     main = "Dichte der N(0,1)",
     col = "steelblue")

SimulierteWerte <- rnorm(10000,mean = 0, sd =1)
hist(SimulierteWerte,freq = FALSE,
     col = "red")
lines(xAchse, DichteSN,
      col = "steelblue",
      lwd = 2)