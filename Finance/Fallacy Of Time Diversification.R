#### Fallacy Of Time Diversification ####
# By Prof Dr Hillebrand
# Stochastische Prozesse
# HTW Berlin

## Daten einlesen: S&P500
daten <- read.csv("SP500.csv", header=T, sep=";", dec=",")

S <- daten$RI #Performance Index inkl. Dividenden als Grundlage der Untersuchung
tS <- as.Date(paste(daten$Datum, "01", sep="/"), "%Y/%m/%d") #Datum fuer R verstaendlich machen
t <- tS[2:length(tS)]
logS <- log(S)
r <- diff(logS)
n <- length(r);n
plot(tS, logS, type="l")#
plot(t, r, type="l")
summary(r)*100

## Histogramm 
h<-hist(r,c(-0.9,seq(-0.4,0.4,0.01),0.9));h$counts

## Fallacy of time diversification, ACHTUNG: ueberlappende Zeitraeume
y <- c(1,2,5,10,15,20) #Vektor der Horizonte, die man betrachten moechte

## Annualisieren
ann <- FALSE #je nachdem, ob man annualisieren möchte oder nicht
ann <- TRUE

## Schleife ueber alle Horizonte in Jahren, die betrachtet werden
for (j in y){
  if (ann){
    r <- diff(logS,lag=12*j)/j #annualisierte log. Renditen
  }
  else {  
    r <- diff(logS,lag=12*j) #nicht annualisierte log. Renditen
  }
  if (j == 1){
    liste <- list(r)
  }
  else
  {
    liste <- c(liste,list(r))
  }
}

names(liste) <- y
bp <- boxplot(liste,xlab="Horizont in Jahren")

sqrt(20)/sqrt(10) #von 10 nach 20 muesste eigtentlich 1,414fach weiter sein, nicht annualsiert! Ist aber weniger.
bp$stats #Spannweite nicht so viel mehr bei 20 im Vgl. zu 10
sd(liste$"20")/sd(liste$"10") #Vola-Verhaeltnis auch etwas weniger als erwartet

