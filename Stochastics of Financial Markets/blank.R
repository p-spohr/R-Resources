daten <- read.csv2('DaxEinzeln.csv', header = TRUE)

head(daten)
colnames(daten)

S <- cbind(daten$BAYER..XET.,daten$BASF..XET.,daten$DEUTSCHE.BANK..XET.,daten$SAP..XET.,daten$VONOVIA..XET.)
N <- 5
colnames(S) <- c('Bayer', 'Basf','Deutsch Bank', 'SAP', 'Vonovia')

head(S)

r <- diff(log(S))

head(r)

R <- exp(r) - 1
head(R)

dim(r)

mu_tag <- apply(r, 2, mean)


mu_jahr <- mu_tag * 250 * 100


t.test(r[,1], conf.level = 0.99)

# row column slicing
r[1:10,1:2]
