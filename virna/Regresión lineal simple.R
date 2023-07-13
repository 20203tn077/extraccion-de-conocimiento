# REGRESIÓN LINEAL SIMPLE
marketing <- read.csv('../../csv/data-marketing.csv')

data <- data.frame(
  x = as.numeric(marketing$Spend),
  y = as.numeric(marketing$Sales)
)

## Obtener valores de tabla

data$xy <- data$x * data$y
data$xe2 <- data$x ** 2

data

## Calcular valores de apoyo

n <- length(data$x)
Σx <- sum(data$x)
Σy <- sum(data$y)
Σxy <- sum(data$xy)
Σxe2 <- sum(data$xe2)

## Obtener ecuación

a <- (n * Σxy - Σx * Σy)/(n * Σxe2 - Σx ** 2)
b <- (Σy * Σxe2 - Σx * Σxy)/(n * Σxe2 - Σx ** 2)

## Generar Predicción

x1 <- min(data$x)
x2 <- max(data$x)

y1 <- a * x1 + b
y2 <- a * x2 + b

prediction <- data.frame(
  Spend = c(x1, x2),
  Sales = c(y1, y2)
)

## Graficar

plot(data$x, data$y)
lines(prediction)
# USING GGPLOT2