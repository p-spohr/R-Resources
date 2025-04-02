library(readxl)

read_excel("C:\\Users\\pat_h\\OneDrive\\p-spohr-repos\\Optimisfits\\st_data\\AAPL.xlsx")

read.csv("C:\\Users\\pat_h\\OneDrive\\p-spohr-repos\\Optimisfits\\AAPL.csv", sep = ';')

all_parent_dir = 'all_securities_test'
path_to_all = paste0(getwd(), '/', all_parent_dir)
all_security_csv = list.files(path_to_all)

tickers = vector('character')
i=1
for(file_n in all_security_csv) {
  tickers[i] = unlist(strsplit(file_n, split = '[.]'))[1]
  i = i + 1
}

port_meta = data.frame(Ticker = tickers)
port_meta

write.csv(port_meta[1], file = 'test_portfolio.csv', row.names = FALSE)

test_dates = c('2025.03.03', '2025-03-03', '2025-03-03')

for(fp in list.files('crypto_prices')) {
  print(head(read.csv(paste0('crypto_prices', '/', fp))))
}

btc_prices = read.csv(paste0('crypto_prices', '/', 'BTC-USD.csv'))

btc_prices$Price

# convert character '20,000' with comma into numeric
as.numeric(lapply(btc_prices$Price, gsub, pattern = ',', replacement = ''))

?grepl
