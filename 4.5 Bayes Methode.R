#Streikwillige einer Belegschaft
#Ein Statistiker untersucht den Anteil   der Streikwilligen einer Belegschaft. Dabei geht er von folgender A-priori-Verteilung aus. 
#Anteil Streikwilliger	0,2	0,4	0,6	0,8
#A-priori Wahrscheinlichkeit	0,2	0,6	0,15	0,05
#Eine zusaetzlich erfolgte Umfrage unter 20 Arbeitern ergab 16 Stimmen fuer Streik und 4 dagegen. 
#a)	Bestimmen Sie die A-posteriori Wahrscheinlichkeitsverteilung.
#b)	Welcher Schaetzwert fuer den Anteil   ergibt sich, wenn man 
#i.	den Erwartungswert bzw. den Modus der A-priori-Verteilung verwendet.
#ii.	nur die Stichprobe einbezieht und die A-priori-Verteilung ausser Acht laesst.
#iii.	den Erwartungswert bzw. den Modus der A-posteriori-Verteilung verwendet.

#a)
n<-20
x<-16
p<-c(0.2,0.4,0.6,0.8)
#A-priori Verteilung
prior<-c(0.2,0.6,0.15,0.05)
dbinom(x = x,size = n,prob = p[1])
dbinom(x = x,size = n,prob = p[2])
dbinom(x = x,size = n,prob = p[3])
dbinom(x = x,size = n,prob = p[4])

h<-rep(0,4)
post<-rep(0,4)
h[1]<-dbinom(x = x,size = n,prob = p[1])*prior[1];h[1]
h[2]<-dbinom(x = x,size = n,prob = p[2])*prior[2];h[2]
h[3]<-dbinom(x = x,size = n,prob = p[3])*prior[3];h[3]
h[4]<-dbinom(x = x,size = n,prob = p[4])*prior[4];h[4]
sum(h)
#A-posteriori Verteilung
post[1]<-h[1]/sum(h)
post[2]<-h[2]/sum(h)
post[3]<-h[3]/sum(h)
post[4]<-h[4]/sum(h)
post
#Kontrolle
sum(post)

#b)
#b) i)
#Erwartungswert A-priori
p%*%prior
#Modus A-priori
which.max(prior)
p[which.max(prior)]
#b) ii)
#Stichprobe
16/20
#b) iii)
#Erwartungswert A-posteriori
p%*%post
#Modus A-posteriori
which.max(post)
p[which.max(post)]
