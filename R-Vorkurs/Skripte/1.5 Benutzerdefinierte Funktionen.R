# Benutzerdefinierte Funktionen

rm(list = ls())

# einfachste Funktion, keine Parameter
hallo <- function() {
  print('Hallo!')
}

hallo()

# ein Parameter
name_hallo <- function(name) {
  print(paste0('Hallo, ', name, '!'))
}

name_hallo(name = 'Thomas')
name_hallo('Thomas')

name_alter <- function(name, alter) {
  print(paste0('Ich bin ', name, ' und ', alter, ' Jahre alt.'))
}

name_alter('Vera', 24)
name_alter(24, 'Vera')
# benannte Argumente kann in beliebige Reihenfolge sein
name_alter(alter = 24, name = 'Vera')

# alle Datentypen und Datenstrukturen funktioniert, sobald die Funktion die richtig handelt
sportarten_liste <- c('Fußball', 'Schwimmen', 'Hockey', 'Tischtennis')
mein_lieblingssport <- function(sportarten) {
  if ('Hockey' %in% sportarten) {
    print('Ich spiele gern Hockey!')
  } else {
    print('Ich spiele nicht gern.')
  }
}

mein_lieblingssport(sportarten_liste)

# vorgegebene Parameter
student_id <- function(s_id, fachbereich, schule = 'HTW Berlin') {
  if (s_id == 12345) {
    print(paste0('Er/Sie ist ein Student an der ', schule, ' in Fachbereich ', fachbereich))
  } else {
    print('Nicht gefunden!')
  }
}

student_id(12345, 4)
student_id(0, 4)
student_id(12345, 4, 'BHT Berlin')

# geben das Ergebnis zurück
fx_1 <- function(vect, t) {
  return(sin(vect)/(pi - t))
}

ergebnis_1 <- fx_1(seq(1,10), 0.4)
ergebnis_1

# vectorize eine Funktion
fx_2 <- function(zahl) {
  if (zahl %% 2 == 0 ){
    return(exp(zahl / 100))
  } else{
    return(0)
  }
}

fx_2(10)
fx_2(3)
fx_2(c(10,3,0,2, -1)) # ERROR

fx_2v <- Vectorize(fx_2)
fx_2v(c(10,3,0,2, -1))

# apply Funktionen
set.seed(123)
x1 <- floor(runif(10, min = -10, max = 10))
X1 <- matrix(x1, ncol = 2)
X1
?apply
apply(X = X1, FUN = max, MARGIN = 1) # Zeilen entlang (waagerecht)
apply(X = X1, FUN = max, MARGIN = 2) # Spalten entlang (senktrecht)

x2 <- runif(1000, min = -10, max = 10)
X2 <- matrix(x2, ncol = 10 )
apply(X2, FUN = mean, MARGIN = 2)
mean(X2[,1]) # Prüfen Sie das Ergebnis

# anonyme Funktion
sapply(c(1,2,3,4,5), function(x) x^2)
