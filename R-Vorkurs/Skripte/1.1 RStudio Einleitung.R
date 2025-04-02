# Einleitung

# Navigation ####

## schreiben Sie '#' vorne für Kommentare (keine Ausführung)

## CTRL + ENTER => führt Zeile aus und Cursor geht zum nächsten Teil
12345 # output 12345

## ALT + ENTER => führt Zeile aus und Cursor bleibt
print('Hallo!') # output Hallo!

## erstellen Sie einen Abschnitt mit '# HEADER 1 ####'
## erstellen Sie einen Unterabschnitt mit '## HEADER 2 ####'
## CTRL + ALT + T => führt Abschnitt aus und Cursor bleibt
# 1. Abschnitt ####
print('1. Abschnitt!') # output Hallo!
1
# 2. Abschnitt ####
print('2. Abschnitt!') # output Hallo!
2
# 3. Abschnitt ####
print('3. Abschnitt!') # output Hallo!
3
# END Abschnitt ####

## CTRL + L => leert console

## CTRL + SHIFT P => öffnet Command Palette
## ALT + SHIFT K => öffnet Hotkey Cheet Sheet

## CTRL + SHIFT + N => erstellt neues R-script
## CTRL + S => speichert Datei
## CTRL + ALT + S => speichert alle

## Hotkey Documentation
# https://docs.posit.co/ide/user/ide/reference/shortcuts.html
# CTRL + Right Mouse => öffnet Links

## wählen Sie die Zeilen + CTRL + SHIFT + C =>  Kommentare Umschaltung
# a
# b
# c
# (keine  Blockkommentare verfügbar)

## CTRL + F => findet und ersetzt ein Wort

## CTRL + D => löscht Zeile
# CTRL + Z (macht es rückgängig)

## CTRL + SHIFT + D => dupliziert Zeile
# complex32 number23 and34 words23 DUPLICATE!
# complex32 number23 and34 words23 DUPLICATE!
# complex32 number23 and34 words23 DUPLICATE!

# CTRL + ALT + rechte Maustaste => mehrfache Cursor
# Hi, my name is Patrick. I wrote this all in one go!
# Hi, my name is Patrick. I wrote this all in one go!
# Hi, my name is Patrick. I wrote this all in one go!

# CTRL + ALT + auf/ab => mehrfache Cursor
# Just like above, I can write a lot quickly.
# Just like above, I can write a lot quickly.
# Just like above, I can write a lot quickly.

# ALT + SHIFT + auf/ab => dupliziert Zeile auf/ab
# 123456789

## CTRL + SHIFT + H => wählen Sie Arbeitsverzeichnis
# (Prüfen Sie mit Files Scheibe)

## wählen Sie die Zeilen + ALT + auf/ab Arrow
# verschiebt Zeilen ohne andere zu beeinflussen
# "Coding like poetry should be short and concise." - Santosh Kalwar

## ALT + auf/ab Pfeil
# verschiebt Zeile auf/ab

## ALT + rechts/links Pfeil
# verschiebt Cursor vorne und hinten (Zeile)

## CTRL + rechts/links Pfeil
# verschiebt Cursor vorne und hinten (Wort)

## CTRL + SHIFT + auf => wählt Abschnitt
# 10101010101010101010
# 10101010101010101010

## ALT + K => wählt nächstes Wort
# Jump from WOW to the next WOW!
# Jump from WOW to the next WOW!
# Jump from WOW to the next WOW!

## CTRL + ALT + K => wählt nächstes Wort and kopiert Cursor
## !!!Sie Müssen es in Tools->Modify Keyboard Shortcuts ändern.
## Name: Find and Add Next
# Jump from SUPER to the next SUPER!
# Jump from SUPER to the next SUPER!
# Jump from SUPER to the next SUPER!

# CTRL + J => trennt Zeile am Cursor
# abcdefghijklmnopqrstuvwxyz

# CTRL + K => yankt alles nach Cursor
# This is pracitce. Get everything after the first sentence.
# This is pracitce. Get everything after the first sentence.

# CTRL + U => yankt alles vor Cursor
# This is pracitce. Get everything before the first sentence.
# This is pracitce. Get everything before the first sentence.

# CTRL + Y => fügen geyankte Zeile ein
# This is pracitce. Get everything after the first sentence.
# This is pracitce. Get everything after the first sentence.

# Allgemeine Funktionen und Hilfe ####

# Arbeitsverzeichnis
getwd()

# erstellen Sie Arbeitsverzeichnis
# dir <- "C:/users/my_name/my_class/assignments"
# setwd(dir) # sets new working directory
# Session->Set Working Directory->Choose Directory

# Hilfe
?help # go to documentation using '?' before function
?setwd # go to setwd documentation
?print # go to print documentation

# löscht Variablen
rm(list = ls()) # clears all variables
rm(x, y) # clears x and y variables

## R Setup
?options
options()

## aktuelles Datum
?date
date()

# Package und Bibliothek

install.packages('cowsay')
library(cowsay)
library(help = 'cowsay')

say(what = "Let's Learn R!")

say(what = "Let's Learn R!", by = 'dog')

say(what = "R is not as scary as me!", by = 'shark')

# Beschreibung
packageDescription('stats')

# Liste von Funktionen
library(help = 'stats')

# Liste von allen verfügbaren Packages
library()

# Liste von allen aktuellen Bibliotheken
search()

# Objekttypen ####

# https://www.w3schools.com/r/r_data_types.asp
# numeric - (10.5, 55, 787)
22.22 # float

# integer - (1L, 55L, 100L, "L" steht für integer)
3L == 3.0 # [1] TRUE
3L == 3.1 # [1] FALSE
class(3L) # [1] "integer"
class(3) # [1] "numeric"

# complex - (9 + 3i)
?complex # lesen Sie für mehr Information (für unser Program nicht wichtig)
com <- 2 + 3i
class(com) # [1] "complex"

# character (a.k.a. string) - ("k", "R is exciting", "FALSE", "11.5")
"HI" # [1] "HI"
'HEY' # [1] "HEY"

# logical (a.k.a. boolean) - (TRUE or FALSE)
TRUE # [1] TRUE
T # [1] TRUE
FALSE # [1] FALSE
F # [1] FALSE

"TRUE" == TRUE # [1] TRUE !!!vorsichtig!!!
"FALSE" == FALSE # [1] TRUE !!!vorsichtig!!!
class("FALSE") # [1] "character"
class(FALSE) # [1] "logical"
print(T)  # Abkürzung
print(F)  # Abkürzung
"F" == F # [1] FALSE

t <- 10
class(t) # [1] "numeric" 
name <- "Fred"
class(name) # [1] "character"

# Reservierte Konstanten ####

Inf
-Inf
pi

NA
NaN

NULL

