
r = 0.05
K = 50
rlz = 20/52
d1 = 0.0542
d2 = -0.0699
St = 49
sigma = 0.2


-r*K*exp(-r*rlz)*pnorm(d2)-dnorm(d1)*((St*sigma)/(2*sqrt(rlz)))


pnorm(d2)
dnorm(d1)

dnorm(1.9558)
pnorm(1.9847)
