# Standardfunktionen (Standardbibliotheke)

rm(list = ls())

library(help = "base")

# Ausdrucken und Formatierung
print('Hi!')
name <- 'Patrick'

paste('Ich bin', name, sep = ' ')

schwester_zahl <- 2
paste(name, 'hat', schwester_zahl, 'Brüdern')

print(paste0('H', 'T', 'W'))

abc <- c('a', 'b', 'c')
paste(abc)
paste(abc, collapse = '')

toupper(name)
tolower(name)

abc[]

# Zugriff auf die Buchstaben mit strsplit
name
strsplit(name, split = '')[[1]][1]

unlist(strsplit(name, split = ''))[1]

?unlist
lastname <- unlist(strsplit(name, split = ''))
lastname[-c(1, length(lastname))]
lastname[]

email <- 'm.mueller@htwberlin.org'
strsplit(email, split = '@')
strsplit(email, split = '[.]')

# verschachteltes Indizieren
strsplit('Einstein', split = '')
strsplit('Einstein', split = '')[[1]]
strsplit('Einstein', split = '')[[1]][3]

# Trigonometrische Funktion
sin(1)
cos(1)
tan(2)
asin(1)

# natürlicher Logarithmus
log(2)

log(2, base = 10)

# Exponentialfunktion
exp(3)

# Absoluter Wert
abs(-10)

# Wurzel
sqrt(5)

# Summe
sum(c(1,2,3))
sum(c(T, T, T, F))

T * 4
F * 4

# kumulierte Summe
cumsum(c(1,2,3,10))

# Mittelwert
mean(c(1,2,3))

# Standardabweichung
sd(c(1,2,3))

# Fakultät
factorial(4)

# Differenz
diff(c(5,3,10), lag = 1)

# Abrunden
round(4.2131234, digits = 3)

# Obergrenze
ceiling(5.1)

# Untergrenze
floor(2.9)

# Kovarianz
cov(c(2,4,1), c(0,-1,-2))
