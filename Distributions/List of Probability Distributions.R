#### List of Probability Distributions in R ####
## d (density), p (cumulative probability), q (quantile), r (random generator)


# binomial (including Bernoulli) distribution
?dbinom
?pbinom
?qbinom
?rbinom

# geometric distribution
?dgeom
?pgeom
?qgeom
?rgeom

# normal distribution
?dnorm

# log-normal distribution
?dlnorm

# exponential distribution
?dexp

# Poisson distribution
?dpois

# Student's t distribution
?dt

# uniform distribution
?dunif

# hypergeometric distribution
?dhyper

# gamma distribution
?dgamma

# chi-squared distribution
?dchisq

# negative binomial distribution
?dnbinom

# F distribution
?df

# multinomial distribution
?dmultinom

# Weibull distribution
?dweibull

# Cauchy distribution
?dcauchy

# beta distribution
?dbeta


dnorm(0)
pnorm(0)
qnorm(0.5)

pnorm(4) - pnorm(-4)

dexp(2, rate = 1)
pexp(c(1,2,3), rate = 1)

plot(seq(0,5,0.1), dexp(seq(0,5,0.1), 1))

plot(seq(0,5,0.1), pexp(seq(0,5,0.1), 1))
abline(v = 2)
pexp(2, 1)





