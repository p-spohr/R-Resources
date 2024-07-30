# quantiles

n <- 100
x <- cumsum(rnorm(n, 0, 1:n))
x <- (x + abs(min(x)) * 1.5) / sqrt(n)
plot(x, type = 'l')

?quantile

min(x)
quantile(x, 0.9)

x_sort <- sort(x) ; x_sort

# 90% of values are that value or below, or 10% values are above
x_sort[n*0.9]

sum(x_sort[89:90]) / 2

mean(x)
median(x)

  