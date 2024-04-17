# R-Aufgabe: Garantie fuer Waschmaschinen
# Sie beraten einen Premium Hersteller von Waschmaschinen. 
# Dieser Hersteller ist bekannt dafuer, dass seine Maschinen besonders 
# lange ohne Defekt arbeiten und dass die Maschinen nach der 20-taegigen Reparatur 
# wie neu sind. Nun wird diskutiert, die Garantie von 6 Monaten auf 2 Jahre zu verlaengern. 
# Grundlage ihrer Untersuchung sind die Daten zu defekten Waschmaschinen 
# in der Datei "Waschmaschinen.csv". Darin ist neben der geraetnummer der Maschine 
# die Anzahl der Tage nach dem Verkaufsdatum aufgefuehrt, 
# die bis zur Ankunft der Waschmaschine zur Reparatur beim Hersteller vergangen sind. 
# Wir rechnen mit 365 Tagen pro Jahr. 
# a)	Berechnen Sie so viele gueltige Lebensdauern (Zeit bis zur Reparatur einer als neu 
#     geltenden Waschmaschine) wie moeglich. Wie gross ist ihre Stichprobe?
# b)	Erstellen Sie ein Histogramm der Lebensdauern aus a) und folgern Sie daraus und 
#     aus den beschriebenen Umstaenden auf eine plausible Wahrscheinlichkeitsverteilung der Lebensdauer. 
# c)	Schaetzen Sie die Wahrscheinlichkeit, dass eine verkaufte oder reparierte Waschmaschine 
#     innerhalb des geplanten Garantiezeitraums von 2 Jahren als defekt gemeldet wird.

#Daten einlesen
data <- read.csv("Waschmaschinen.csv", header = TRUE, sep = ",")
head(data)

# a)
# Sortieren
Ordnung <- order(data$Nummer,data$Tage)
head(Ordnung)

data <- data.frame(Nummer = data$Nummer[Ordnung], Tage = data$Tage[Ordnung])
data

# einige geraetnummern sind doppelt
h <- which(duplicated(data$Nummer))
h

# diese Maschinen wurden zweimal repariert, d.h. ihre Lebensdauer muss korrigiert werden 
# um die erste Lebensdauer und um die 20 Tage Reparaturzeit
data$Tage[h] <- data$Tage[h] - data$Tage[h-1] - 20
sum(data$Tage <= 0) # Kontrolle ob Tage <= 0 dabei
data
length(data$Tage) # Stichprobenumfang

# b)
intervalle <- seq(0,max(data$Tage)+1000,by=500)
hist(data$Tage, breaks = intervalle, main = "Histogramm der Lebensdauern") # Histogramm der absoluten Haeufigkeiten
# Lambda Schaetzen
lambdaDach <- 1/mean(data$Tage)
# Sind Lebensdauern ungefaehr exponentialverteilt?
hist(data$Tage,breaks = intervalle, freq = FALSE, main = "Histogramm der Lebensdauern")
curve(dexp(x, rate = lambdaDach), add = TRUE, col = "BLUE") # passt ganz gut
qqplot(qexp( ppoints(500), rate = lambdaDach), data$Tage,
       main = "Q-Q plot Exponentialverteilung", xlab = "Theoretische Quantile", ylab = "Quantile Lebensdauern") #ppoints ??
qqline(data$Tage, distribution = function(p) qexp(p, rate = lambdaDach))
# sieht sehr nach Exponentialverteilung aus! (Passende Tests dazu in Statistik 3)
# Dies macht aufgrund der Angaben (Gedaechtnislosigikeit) auch Sinn.

# c)
# GeSchaetzte erwartete Lebensdauer in Jahren
1/(lambdaDach*365)
# WK, dass dass eine verkaufte oder reparierte Waschmaschine 
# innerhalb des Garantiezeitraums von 0,5 (bisher) 2 Jahren (Ziel) als defekt gemeldet wird
# Nutze Plug-In Schaetzer
pexp(365/2, rate = lambdaDach) # im halben Jahr nur 5%
pexp(2*365, rate = lambdaDach) # in 2 Jahren schon fast 19 %

# Aufraeumen
rm(list = ls())


# R-Aufgabe 4.2: 
# Zur numerischen Bestimmung der Maximum-Likelihood-Schaetzung der Parameter der Gamma-Verteilung gehen Sie folgendermassen vor:
# a)	Generieren Sie ein Stichprobe der laenge 100 zur Gammaverteilung mit den Parametern  .
# b)	Berechnen Sie die Schaetzer der beiden Parameter mit der Momentenmethode (Formeln siehe Vorlesung) 
# c)	Definieren Sie die negative log Likelihood-Funktion in diesem Fall. 
      # (Negativ, da die meisten Optimierungsalgorithmen minimieren und nicht maximieren)
# d)	Minimieren Sie die Funktion aus c) mit Hilfe der Funktion "nlm" und den Startwerten aus b). 
      # Sind diese ML-Schaetzer naeher an den wahren Werten als die MomentenSchaetzer?
# e)	Nutzen Sie nun zur Berechnung der ML-Schaetzer die Funktion "fitdistr" aus der Bibliothek "MASS" und vergleichen 
      # Sie die Ergebnisse mit denen aus d).

set.seed(22)
n <- 100
x <- rgamma(n, shape = 5, scale = 3) # shape = alpha, scale = beta
x
# MomentenSchaetzer laut Vorlesung
mw <- mean(x)
alphaDach <- mw^2/(mean(x^2)-mw^2)
betaDach <- mw/alphaDach
alphaDach;betaDach
# Maximum Likelihood-Schaetzer numerisch:
# negative log. Likelihood Funktion definieren, da Optimierung eine Minimierung ist.
negativeLogLikelihood <- function(v){
  (-1)*sum(dgamma(x, shape = v[1], scale = v[2], log = TRUE))
}
negativeLogLikelihood( c(alphaDach, betaDach)) # ein Test

# Non Linear Minimisation
?nlm
nlm(negativeLogLikelihood, p = c(alphaDach, betaDach), stepmax=0.5)

library(MASS)
?fitdistr
fitdistr(x, "gamma", start=list(shape=alphaDach, scale=betaDach))#$estimate

# Aufraeumen
rm(list = ls())