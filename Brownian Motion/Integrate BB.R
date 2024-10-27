
delta_t <- 0.0001
t<- seq(0, 1, delta_t) # 0.5 is the variance sqrt(0.5) is the standard deviation

BB <- cumsum(rnorm(length(t), 0, sqrt(delta_t)))

plot(t, BB, type='l')
# ?plot

inta_BB <- cumsum(delta_t * BB)

lines(t, inta_BB, type='l', col='red')
# ?lines

sum(BB)
sum(diff(t))


mean_arr <- vector('numeric')

for (i in 1:1000) {
  
  BB_loop <- cumsum(rnorm(length(t), 0, sqrt(delta_t)))
  # normal Bt dBt integration
  mean_arr[i] <- sum(BB_loop[2:10001] * diff(BB_loop) * delta_t)

}

round(mean(mean_arr), 5)
round(median(mean_arr), 5)


mean_arr <- vector('numeric')

for (i in 1:1000) {
  
  BB_loop <- cumsum(rnorm(length(t), 0, sqrt(delta_t)))
  
  mean_arr[i] <- sum(exp(BB_loop[2:10001]) * diff(BB_loop) * delta_t)
  
}

round(mean(mean_arr), 5)
round(median(mean_arr), 5)
    