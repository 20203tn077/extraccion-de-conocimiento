# REGRESIÓN LINEAL MÚLTIPLE
marketing <- read.csv('../../csv/data-marketing.csv')

data <- data.frame(
  x1 = as.numeric(marketing$Month),
  x2 = as.numeric(marketing$Spend),
  y = as.numeric(marketing$Sales)
)

## Generar tabla de valores

data$x1e2 <- data$x1 ** 2
data$x2e2 <- data$x2 ** 2
data$x1y <- data$x1 * data$y
data$x2y <- data$x2 * data$y
data$x1x2 <- data$x1 * data$x2

data

## Obtener coeficientes de regresión

n <- length(data$x1)
.Σx1 <- sum(data$x1)
.Σx2 <- sum(data$x2)
.Σy <- sum(data$y)
.Σx1e2 <- sum(data$x1e2)
.Σx2e2 <- sum(data$x2e2)
.Σx1y <- sum(data$x1y)
.Σx2y <- sum(data$x2y)
.Σx1x2 <- sum(data$x1x2)

Sx1e2 <- .Σx1e2 - (.Σx1 ** 2) / n
Sx2e2 <- .Σx2e2 - (.Σx2 ** 2) / n
Sx1y <- .Σx1y - (.Σx1 * .Σy) / n
Sx2y <- .Σx2y - (.Σx2 * .Σy) / n
Sx1x2 <- .Σx1x2 - (.Σx1 * .Σx2) / n

# Obtener valores para ecuación

my = mean(data$y)
mx1 = mean(data$x1)
mx2 = mean(data$x2)
a1 <- (Sx2e2 * Sx1y - Sx1x2 * Sx2y) / Sx1e2 * Sx2e2 - Sx1x2 ** 2
a2 <- (Sx1e2 * Sx2y - Sx1x2 * Sx1y) / Sx1e2 * Sx2e2 - Sx1x2 ** 2

b <- my - a1 * mx1 - a2 * mx2

## Obtener ecuación

a <- (n * Σxy - Σx * Σy)/(n * Σxe2 - Σx ** 2)
b <- (Σy * Σxe2 - Σx * Σxy)/(n * Σxe2 - Σx ** 2)

## Generar Predicción

x1 <- min(data$Spend)
x2 <- max(data$Spend)

y1 <- a * x1 + b
y2 <- a * x2 + b

prediction <- data.frame(
  Spend = c(x1, x2),
  Sales = c(y1, y2)
)

## Graficar