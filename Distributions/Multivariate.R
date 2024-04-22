# Quelle
# https://blog.revolutionanalytics.com/2016/02/multivariate_data_with_r.html
# By Joseph Rickert
# February 25, 2016
# Abgerufen am 21.4.2024

# SIMULATING MULTIVARIATE DATA
# https://stat.ethz.ch/pipermail/r-help/2003-September/038314.html
# lets first simulate a bivariate normal sample
rm(list = ls())
library(MASS)
# Simulate bivariate normal data
mu <- c(0,0)                         # Mean
Sigma <- matrix(c(1, -.5, -.5, 1), 2)  # Covariance matrix
Sigma

# Generate sample from N(mu, Sigma)
bivn <- mvrnorm(10000, mu = mu, Sigma = Sigma )  # from Mass package
head(bivn)                                      

# Classic Bivariate Normal Diagram
library(ellipse)
rho <- cor(bivn)

plot_legend <- c("99% CI green", "95% CI red","90% CI yellow")

plot(bivn, 
     xlab = "X", ylab = "Y",
     col = "dark blue",
     main = "Bivariate Normal with Confidence Intervals",
     bty = "L")

lines(ellipse(rho), col="red")       # ellipse() from ellipse package
lines(ellipse(rho, level = .99), col="green")
lines(ellipse(rho, level = .90), col="yellow")


legend(3,1,legend=plot_legend,cex = .5, bty = "n")


# Calculate kernel density estimate
bivn.kde <- kde2d(bivn[,1], bivn[,2], n = 50)   # from MASS package


# Contour plot overlayed on heat map image of results
image(bivn.kde)       # from base graphics package
contour(bivn.kde, add = TRUE)     # from base graphics package


# Three dimensional surface
# Basic perspective plot
persp(bivn.kde, phi = 45, theta = 30, shade = .1, border = NA) # from base graphics package

# RGL interactive plot
library(rgl)
col2 <- heat.colors(length(bivn.kde$z))[rank(bivn.kde$z)]
persp3d(x=bivn.kde, col = col2)