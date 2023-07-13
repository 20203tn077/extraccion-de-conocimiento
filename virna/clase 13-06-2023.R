# REGRESIÓN LINEAL SIMPLE

data <- data.frame(
  Spend = c(1000, 4000, 5000, 4500, 3000, 4000, 9000, 11000, 15000, 12000, 7000, 3000),
  Sales = c(9914, 40487, 54324, 50044, 34719, 42551, 94871, 118914, 158484, 131348, 78504, 36284)
)

n <- length(data$Spend)
Σx <- sum(data$Spend)
Σy <- sum(data$Sales)
Σxy <- sum( xy <- data$Spend * data$Sales)
Σx2 <- sum(data$Spend ** 2)

a <- (n * Σxy - Σx * Σy)/(n * Σx2 - Σx ** 2)
b <- (Σy * Σx2 - Σx * Σxy)/(n * Σx2 - Σx ** 2)

x1 <- min(data$Spend)
x2 <- max(data$Spend)

y1 <- a * x1 + b
y2 <- a * x2 + b

prediction <- data.frame(
  Spend = c(x1, x2),
  Sales = c(y1, y2)
)

plot(data)
lines(prediction)

## USING GGPLOT2

install.packages('ggplot2')
library(ggplot2)

ggplot(data, aes(x = Spend, y = Sales)) + geom_point() + theme_light()
mod1 <- lm(Sales ~ Spend, data = data)

ggplot(data, aes(x = Spend, y = Sales)) + geom_point() + theme_light()

# REGRESIÓN LINEAL MÚLTIPLE

## y = a1x1 + a2x2 + anxn + b