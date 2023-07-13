marketing <- read.csv('../../csv/data-marketing.csv')

data <- data.frame(
  Month = as.numeric(marketing$Month),
  Spend= as.numeric(marketing$Spend),
  Sales = as.numeric(marketing$Sales)
)

lm(Sales ~ Spend, data = data)

lm(Sales ~ Spend + Month, data = data)