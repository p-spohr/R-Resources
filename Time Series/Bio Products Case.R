#### Bio Product Sales in Germany ####
## using linear regression and times series

## download data
bio.food <- read_xlsx("Bio Products.xlsx")
head(bio.food)

colnames(bio.food) <- c("year", "sales")

?ts

bio.food.ts <- ts(bio.food$sales, start = 2000)
bio.food.ts

## plot using tibble as object
plot(bio.food, type = "l", lwd = 2.5,
     main = "Bio Product Sales in Germany",
     ylab = "Sales in Billions Euro",
     xlab = "Year")
?plot

## plot using time series as object
plot.ts(bio.food.ts,
        main = "Bio Product Sales in Germany",
        ylab = "Sales in Billions Euro",
        xlab = "Year")
?plot.ts

## simple linear regression with time series
# y sales is a function of x time
# regress y onto x or regress sales onto time
linreg <- lm(bio.food.ts ~ time(bio.food.ts))
abline(linreg, col = "red")
?lm
?time
time(bio.food.ts) # get time of time series object

## extraction of coefficients of linear regression
class(linreg)
linreg # model
linreg$coefficients # get coefficients
beta.0 <- linreg$coefficients[1] # intercept
beta.1 <- linreg$coefficients[2] # time coefficient

## Displaced time index
bio.food.centered.ts <- ts(bio.food$sales, start = -9.5, frequency = 1)
bio.food.centered.ts
plot.ts(bio.food.centered.ts,
        main = "Bio Product Sales in Germany",
        ylab = "Sales in Billions Euro",
        xlab = "Year")

linreg.displaced <- lm(bio.food.centered.ts ~ time(bio.food.centered.ts))
abline(linreg.displaced, col = "red")

linreg.displaced
linreg

?par
par(mfrow = c(2,1)) # create plot space of 2 rows and 1 column
plot.ts(bio.food.ts,
        main = "Bio Product Sales in Germany",
        ylab = "Sales in Billions Euro",
        xlab = "Year")
abline(linreg, col = "red")

plot.ts(bio.food.centered.ts,
        main = "Bio Product Sales in Germany",
        ylab = "Sales in Billions Euro",
        xlab = "Year")

linreg.displaced <- lm(bio.food.centered.ts ~ time(bio.food.centered.ts))
abline(linreg.displaced, col = "red")
