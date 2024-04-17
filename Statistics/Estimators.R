#Aufgabe 4-4
#Im zweiten Weltkrieg benutzten die Alliierten erfolgreich Schaetzmethoden, 
# um das Raketenarsenal der Deutschen Wehrmacht zu Schaetzen. Die Deutschen gaben ihren Raketen Seriennummern von 1 bis N, 
# und mit Hilfe der Nummern der erbeuteten Raketen konnte N geSchaetzt werden. 
# Wir gehen dabei zur Vereinfachung von einer zufaelligen unabhaengigen Stichprobe
# d.h. Ziehen mit Zuruecklegen statt realistischerweise ohne Zuruecklegen), wobei wir fuere zufaellige Nummer   
# der i-ten Rakete eine diskrete Gleichverteilung annehmen. Zur Illustration verwenden wir die folgende konkrete Stichprobe: 
#  x = (77; 30; 5; 39; 28; 10; 27; 12; 73; 49)

x = c(77,30,5,39,28,10,27,12,73,49)

#a)  Bestimmen Sie xquer.
mean(x)
#b)	Wie gross ist der (durch N ausgedrueckte) Mittelwert   der Zahlen 1,2,.,N?
#c)	Ermitteln Sie eine Schaetzung   fuer N mit Hilfe der Momentenmethode.
#Ist diese Schaetzung erwartungstreu?
#d)	Welcher Schaetzwert resultiert bei dieser Methode? Macht der Schaetzwert Sinn?
#e)	Berechnen Sie die Maximum-Likelihood-Schaetzung von N.
max(x)
#Max Likelihood-Funktion
y=rep(0,100);y
y[77:100] = 1/(77:100)^10
y
plot(1:100,y,type="h",main="Likelihood-Funktion")


(77:100)
