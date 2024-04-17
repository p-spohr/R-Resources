# R-Aufgabe 2.1: 
# Zur Beurteilung des Verhaltens des Schaetzers vom Erwartungswert bei der 
# Normalverteilung fuehren Sie folgendes Experiment in R durch:
# a)	Generieren Sie 500 verschiedene Stichproben der Laenge   zur Normalverteilung   mit  . 
# b)	Schaetzen Sie fuer jede Stichprobe  . Wie oft trifft der Schaetzer den wahren Wert genau?
# c)	Geben Sie das Histogramm der 500 Schaetzer von   an.
# d)	Ergaenzen Sie nun das Histogramm um die wahre Verteilung des Schaetzers.
# e)	Wiederholen Sie die Schritte a) - d) mit der Stichprobenlaenge
#     und zeichnen Sie die neue Grafik unterhalb der alten. Was faellt Ihnen auf?

op <- par(mfrow = c(2,1)) # 2 Grafiken untereinander
# Parameter der Normalverteilung
mu <- 3
sigma <- 1

m <- 500 # Anzahl Stichproben
n <- 100 # Stichprobenlaenge

# Werfe m Stichproben der Laenge n und bilde jedes Mal den Mittelwert
set.seed(14)
mw=rep(0,m)
for(i in 1:m){
  mw[i]=mean(rnorm(n, mean = mu, sd = sigma))
}

mw[1]

sum(mw == mu) # in der Regel trifft der Schaetzer den wahren Wert gar nicht!

# Stelle Histogramm und wahre Verteilung des Schaetzers in einer Grafik dar.
hist(mw,breaks=seq(mu-0.5,mu+0.5,by=0.005),freq=FALSE)
curve(dnorm(x,mean=mu,sd=sigma/sqrt(n)), add=TRUE, col="BLUE") # Theoretische Verteilung wie aus der Vorlesung bekannt

# Zweite Runde:
n <- 10000 # Stichprobenlaenge in der zweiten Runde
for(i in 1:m){
  mw[i]=mean(rnorm(n, mean = mu, sd = sigma))
}
sum(mw == mu) # in der Regel trifft der Schaetzer den wahren Wert gar nicht!

# Stelle Histogramm und wahre Verteilung des Schaetzers in einer Grafik dar.

hist(mw,breaks=seq(mu-0.5,mu+0.5,by=0.005),freq=FALSE)
curve(dnorm(x,mean=mu,sd=sigma/sqrt(n)), add =TRUE,col="BLUE") 
# Theoretische Verteilung, sehr viel schmaler, kleinere Varianz des Schaetzers

par(mfrow = c(1,1)) #Grafikparameter zuruecksetzen

# Aufraemen
rm(list = ls())