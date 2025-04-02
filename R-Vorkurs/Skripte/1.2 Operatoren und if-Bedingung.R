# Operatoren und if-Bedingung

rm(list = ls())

## Arithmetik ####

## addition
10 + 10 # = 20

## subtraction
8 - 4 # = 4

## multiplication
2 * 2 # = 4

## division
100 / 20 # = 5

## exponential
9^2 # = 81
9**2 # = 81

## PEMDAS (parenthesis, exponents, multiplication, division, add, subtract)
(1 + 1) + 2^2 - 10 / 5 * 2 # = 2
# 2 + 4 - 2 * 2
(1 + 1) + 2^2 - 10 / (5 * 2) # = 5
# 2 + 4 - 1

# modulo (Modulo-Bestimmung bedeutet, den Rest einer ganzzahligen Division zu ermitteln)
5 %% 5 # = 0
20 %% 5 # = 0
20 %% 18 # = 2
if (3%%2 != 0) print("odd") else print('even')
if (8%%2 == 0) print("even") else print('odd')

## Initialisierung ####

# benutzen Sie <- um Variablen zu initialisieren
x <- 2 # üblich
y = 3 # nicht üblich aber erlaubt
# mit ';' kann man mehrere Befehle in einer Zeile ausführen
x ; y

x + y

x <- 0 # überschreiben Sie x mit 0

y / x # = Inf (!!!vorsichtig!!! Kein Fehler wird gemeldet)

# Benennungsregel

n <- "Tim" # !!!schwer zu finden und ändern!!!
name <- "Tim" # besser
# name <- 'Tim'

satz <- "Let's go coding!"

# use '_' or '.' um worte zu kombinieren
customer_name <- "Tim"
customer.name <- "Tim"

# keine Zahlen vorne erlaubt
# 5_year_returns <- 0.2 ERROR
year_returns_5 <- 0.2 # works!

## Vergleichsoperatoren ####

# !!!vorsichtig!!! großer Unterschied zwischen '=' und '=='
5 == 5 # [1] TRUE
5 != 5 # [1] FALSE

1 < 5 # [1] TRUE
5 > 10 # [1] FALSE
5 >= 5 # [1] TRUE
5 <= 4 # [1] FALSE

## Kombinationoperatoren
# und mit '&&'
1 < 3 && 2 == 2 # [1] TRUE
1 < 3 && 2 != 2 # [1] FALSE
7 < 3 && 3 != 2 # [1] FALSE # two false comparisons
1 == 1 && 2 == 2 && 3 == 3 # [1] TRUE # can use more than two

# oder mit '|'
1 < 3 | 2 == 2 # [1] TRUE
1 < 3 | 2 != 2 # [1] TRUE
7 < 3 | 3 != 2 # [1] TRUE # two false comparisons
1 == 1 | 2 == 2 | 3 == 3 # [1] TRUE # alle wahr
1 == 1 | 2 == 2 | 3 != 3 # [1] TRUE # alle wahr, bis auf eins
1 != 1 | 2 != 2 | 3 != 3 # [1] FALSE # keine wahr

# if-Bedingung ####

hungrig <- T

if (hungrig) {
  print('Ich habe Hunger!')
}

bargeld <- 20

if (bargeld > 10) {
  print('Ich habe genug Bargeld dabei!')
}

if (hungrig && bargeld > 10) {
  print('Ich kaufe einen Döner!')
} else if (!hungrig) {
  print('Ich habe keinen Hunger!')
} else if (bargeld < 15) {
  print('Ich habe nicht genug Bargeld dabei!')
}




