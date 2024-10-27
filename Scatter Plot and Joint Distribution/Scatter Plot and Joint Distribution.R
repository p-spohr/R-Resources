install.packages("scatterplot3d")
# Quelle: http://www.sthda.com/english/wiki/scatterplot3d-3d-graphics-r-software-and-data-visualization#install-and-load-scaterplot3d

library("scatterplot3d")

daten <- c(1,1,3/8,
           1,2,1/8,
           1,4, 1/8,
           2,1,1/8,
           2,2,1/8,
           2,4,1/8)

daten <- matrix(daten, byrow = TRUE, ncol = 3)
daten

s3d <- scatterplot3d(daten, 
                     pch = 16, 
                     color = "steelblue",
                     grid = TRUE, 
                     box = FALSE, 
                     type = "h",
                     xlim = c(0,2.5),
                     ylim = c(0,4),
                     zlim = c(0,1),
                     xlab = "x",
                     ylab = "y",
                     zlab = "p",
                     main = "Gemeinsame Dichte")

s3d$points3d(t(c(-0.2,1,4/8)), type = "h", col = "red", lwd = 2)
s3d$points3d(t(c(-0.2,2,2/8)), type = "h", col = "red", lwd = 2)
s3d$points3d(t(c(-0.2,4,2/8)), type = "h", col = "red", lwd = 2)

s3d$points3d(t(c(1,5.5,5/8)), type = "h", col = "darkgreen", lwd = 2)
s3d$points3d(t(c(2,5.5,3/8)), type = "h", col = "darkgreen", lwd = 2)

p2 <- s3d$xyz.convert(0,-1,0)
p3 <- s3d$xyz.convert(3,-1,0)
segments(p2$x,p2$y,p3$x,p3$y,lwd=2,col="black")
