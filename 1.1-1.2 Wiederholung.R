##Daten einlesen und plotten: DAX

rm(list = ls())

#vorher Arbeitsverzeichnis richtig setzen
daten <- read.csv("Dax(D).csv", header=TRUE)
head(daten)



#Daten zuordnen und plotten

S <- daten$DAX
tS <- strptime(daten$Datum,format="%d.%m.%Y")
plot(tS,S,type="l")

#log. Renditen
s <- log(S) #kleines s ist log vom grossen S
plot(tS,s,type="l")
r <- diff(s)
n <- length(r)
t <- tS[2:length(tS)]
plot(t,r,type="h")

#Diskrete Renditen
R <- exp(r)-1
plot(t,R,type="h")

##Dexkriptive Statistik der Dax-Renditen
##Daten einlesen sollte bereits ausgefuehrt sein, damit sind
## n, R, r, S, s, t, tS vorhanden

#Grundlegende Deskriptive Statistik fuer
#log Renditen (voellig analog fuer diskrete Renditen):
#Histogramm, emp. Verteilungsfunktion, Boxplot, Lage- und Streumasse, qqplot

#lineare Regression
plot(t, r, type = "l")
head(S)

#Minimum, Maximum
min(r);max(r)
which.min(r); which.max(r)
t[which.min(r)];t[which.max(r)]

#die jeweils 6 groessten und kleinsten Tage
h <- order(R)
data.frame("Tag" = head(t[h]),"Rendite in Prozent" = round(100*head(R[h]),2))
data.frame("Tag" = tail(t[h]),"Rendite in Prozent" = round(100*tail(R[h]),2))

#Histogramm

h <- hist(r, seq(-0.14, 0.12, 0.005))

#?hist
h$counts
hist(r, seq(-0.14, 0.12, 0.001))
h <- hist(r, c(-0.14, seq(-0.05, 0.05, 0.005), 0.12));h$counts

#Emp. Vtlgs-Funktion und Vergleich mit Normalverteilung
plot.ecdf(r, xlim = c(-0.05, 0.05))
curve(pnorm(x, mean = mean(r), sd = sd(r)), add = TRUE, col = "BLUE")

#Boxplot
boxplot(r)
boxplot(r, range = 0)

#Lagemasse
mean(r)
mean(r)*250*100#annualisiert in %
median(r)
quantile(r, seq(0.25, 0.75, by = 0.25))#Quartile
quantile(r, seq(0, 1, by = 0.1))#Dezile
summary(r)

n <- length(S)

(S[n]/S[1])^(1/(n-1))-1#geometrische Rendite der diskreten Renditen
log((S[n]/S[1])^(1/(n-1)))#log(1+geomRendite) entspricht genau der mittleren log. Rendite

#Streuungsmasse
max(r)-min(r)#Spannweite
quantile(r, 0.75, type = 2)-quantile(r, 0.25, type = 2)#Quartilsabstand
mad(r, constant = 1, center = median(r))#mittlere absolute Abweichung vom Median
mad(r, constant = 1, center = mean(r))#mittlere absolute Abweichung vom arithm Mittel
vola <- sd(r);vola#s, also geteilt durch n-1
vola*sqrt(250)*100 #Vola pro Jahr in %
#vola/mean(r)#Variationskoffizient, nicht so sinnvoll hier

#Vergleich der Charts von log. Renditen und Normalverteilung
op <- par(mfrow = c(2, 1))
plot(t, r, type = "l", ylim = c(-0.15, 0.15))
z <- rnorm(length(r), mean = mean(r), sd = sd(r))
plot(t, z, type = "l", ylim = c(-0.15, 0.15))
par(op)

#QQ-Plot
qqnorm(r)#bei den log. Renditen des DAX
qqline(r)

#lineare Regression der Renditen auf die Renditen von gestern
n <- length(r)
model <- lm(r[2:n] ~ r[1:(n-1)])
summary(model)
plot(r[1:(n-1)], r[2:n]) #kein Zusammenhang zu erkennen
abline(model)
plot(model$residuals)

#Aufraeumen
rm(list = ls())