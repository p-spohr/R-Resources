# R-Aufgabe: Wahlbefragung
# Im Vorfeld einer Wahl wurde fuer zufaellig ausgewaehlte waehler aus der Gesamtheit 
# aller waehler festgestellt, ob Sie waehlen wuerden und - falls ja - 
# welche der vier kandidierenden Parteien Sie gegebenenfalls waehlen wuerden:
#         A	    B	  C   D 	Nichtwaehler
# Anzahl	1248	679	168	245	1539
# a)	Mit welchen Wahlergebnissen koennen die Parteien rechnen? 
# b)	Wie hoch schaetzen Sie den Anteil der Nichtwaehler an allen Wahlberechtigten?
# c)	In welchem Bereich liegen die Wahlergebnisse der Parteien mit 95 bzw. mit 99 Prozent Konfidenz? 
# d)	In welchem Bereich liegt der Anteil der Nichtwaehler an allen Wahlberechtigten mit 95 bzw. mit 99 Prozent Konfidenz? 

# a)
x <- c(1248, 951, 679, 158, 245)
n <- sum(x) # Stichprobenlaegne
(mw <- x/n) # geschaetzte Wahlergebnisse

# b)
nw <- 1539
nw / (nw + n) # geschaetzer Anteil der Nichtwaehler an allen Wahlberechtigten
y <- c(x,nw)
y/sum(y) # geschaetze Wahlergebnisse inkl Nichtwaehler

# c)
# zu 95% asymptotische Konfidenz:
b <- qnorm(0.975) * sqrt(mw*(1-mw)/n)
KI <- data.frame("unten" = round(mw - b,4)*100, "oben" = round(mw + b,4)*100)
KI #Konfidenzintervalle in %
binom.test(x[1], n)$conf.int # exaktes Konfidenzintervall fuer Partei A
binom.test(x[1], n)

# zu 99% Konfidenz:
b <- qnorm(0.995) * sqrt(mw*(1-mw)/n)
KI <- data.frame("unten" = round(mw - b,4)*100, "oben" = round(mw + b,4)*100)
KI #Konfidenzintervalle in %
binom.test(x[1], n, conf.level = 0.99)$conf.int  # exaktes Konfidenzintervall fuer Partei A
binom.test(x[1], n, p=0.3803718 , conf.level = 0.99) # p-value = 1, also H nicht ablehnen
binom.test(x[1], n, p=0.38, conf.level = 0.99, alternative="greater") # p=0.38 => p-value=0.4891>0.01 => H nicht ablehnen

# d)
# zu 95% Konfidenz:
mw <- nw / (nw + n)
b <- qnorm(0.975) * sqrt(mw*(1-mw)/n)
KI <- data.frame("unten" = round(mw - b,4)*100, "oben" = round(mw + b,4)*100)
KI
binom.test(nw, n + nw)
binom.test(nw, n + nw)$conf.int # exaktes Konfidenzintervall fuer Nichtwaehler
# zu 99% Konfidenz:
b <- qnorm(0.995) * sqrt(mw*(1-mw)/n)
KI <- data.frame("unten" = round(mw - b,4)*100, "oben" = round(mw + b,4)*100)
KI
binom.test(nw, nw + n, conf.level = 0.99)$conf.int  # exaktes Konfidenzintervall fuer  fuer Nichtwaehler

#Aufraeumen
rm(list = ls())