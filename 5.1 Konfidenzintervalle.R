#Statistik2: Aufgabe Weinflaschen Winzergenossenschaft
x=c(760,756,748,745,745,755,748,760,755,750)
x
n=length(x);n
mean(x)
#a) Konfidenzintervall
alpha=1-0.99
qnorm(1-alpha/2)
qnorm(alpha/2,lower.tail=FALSE)
z=round(qnorm(1-alpha/2),4);z
mean(x)-z*10/sqrt(n) #untere Intervallgrenze
mean(x)+z*10/sqrt(n) #obere Intervallgrenze
# b)
# n muss groessr als
(2*z*10)^2
# sein
# c)
# Alpha muss groessr als
n=40
sqrt(n)/(2*10)
pnorm(sqrt(n)/(2*10))
h=2-2*pnorm(sqrt(n)/(2*10));h
1-h
# sein
# d)
n=10
var(x)
sqrt(var(x))
c=round(qt(1-alpha/2,df=n-1),3);c
mean(x)-c*sqrt(var(x)/n) #untere Intervallgrenze
mean(x)+c*sqrt(var(x)/n) #obere Intervallgrenze
#Alternative:
t.test(x,alternative = "two.sided", conf.level = 0.99)
?t.test

t.test(x,alternative = "two.sided", mu=600, conf.level = 0.99) # p-value kleiner als alpha => H ablehnen
t.test(x,alternative = "two.sided", mu=750, conf.level = 0.99) # p-value großer als alpha => H nicht ablehnen


# Bei der Untersuchung der als exponentialverteilt modellierten Zerfallszeiten 
# eines bestimmten Cäsium-Isotops wurden folgenden Daten in Jahren gemessen:  
u <- c(3.1, 1.2, 7.3, 0.3, 4.6, 1.5)
n <- length(u)
mw <- mean(u) ; mw
lambda <- 1/mw ; lambda
alpha <- 0.05

# Berechnen Sie aus dieser Stichprobe ein exaktes zweiseitiges Konfidenzintervall 
# für die mittlere Lebensdauer des Atoms zum Konfidenzniveau 0,95
2*n*mw / qchisq(1-alpha/2, 2*n) # oberes Konfidenzintervall
2*n*mw / qchisq(alpha/2, 2*n) # unteres Konfidenzintervall

?chisq.test
?t.test
?binom.test

f <- c(11, 15, 16, 18, 20, 18, 5)
g <- c(1, 5, 6, 8, 2, 8, 5)

t.test(f,g, mu=5, alternative="two.sided", paired=FALSE, var.equal = TRUE, conf.level = 0.95)

t.test(f,g, mu=5, alternative="less", paired=FALSE, conf.level = 0.95)











