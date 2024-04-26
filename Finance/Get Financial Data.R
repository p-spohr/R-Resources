
#### Download Financial Data from Yahoo or Google ####


## install package
install.packages("tidyverse")
install.packages("tidyquant")
installed.packages()

## use library
library(tidyquant)
library(tidyverse)

## check out library
help(package = "tidyverse")
tidyverse_packages()
help(package = "tidyquant")

## get prices
#returns data in tibble format
amzn.stock <- tq_get("AMZN", get = "stock.prices", from = "2020-01-01", to = "2024-04-25")
head(amzn.stock)
amzn.stock %>% select(date, close)
class(amzn.stock$date) # date is already Date class

# if date not Date class then set it as date
amzn.stock$date <- as.Date(amzn.stock$date, format = "%Y-%m-%d")
?as.Date
head(amzn.stock)
class(amzn.stock$date)

# filter by using year() from lubridate in tidyverse
amzn.stock$date %>% year()
amzn.stock %>% filter(year(date) == 2021)

# group by year and then summarize basic metrics
amzn.stock %>% group_by(date = year(date)) %>% summarize(amzn_mean = mean(close), 
                                                  amzn_std = sd(close), 
                                                  amzn_min = min(close), 
                                                  amzn_max = max(close))



