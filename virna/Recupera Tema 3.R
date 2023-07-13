# Utilizando el conjunto de datos "Glass" de la librería mlbench realizar script en R que contenga:
library(class)
library(rpart)
library(rpart.plot)
library(mlbench)
library(lattice)
library(ggplot2)
library(e1071)
library(caret)
set.seed(20203077)

eval <- function (confusion.matrix) {
  accuracy <- sum(diag(confusion.matrix)) / sum(confusion.matrix)
  precision <- confusion.matrix[2, 2] / sum(confusion.matrix[, 2])
  recall <- confusion.matrix[2, 2] / sum(confusion.matrix[2, ])
  f1_score <- 2 * (precision * recall) / (precision + recall)

  print(paste("Accuracy:", accuracy))
  print(paste("Precision:", precision))
  print(paste("Recall:", recall))
  print(paste("F1_score:", f1_score))
}

# 1. Cargar conjunto de datos y explorar su contenido y estructura
data(Glass)
print(Glass)
summary(Glass)

# 2. Dividir el conjunto de datos en 70% de datos de entrenamiento y 30% de prueba
sample <- createDataPartition(Glass[, 1], times = 1, p = 0.7, list = FALSE)
train <- Glass[sample, ]
test <- Glass[-sample, ]

# 3. Entrenar modelos

## a) KNN
k <- 3

## b) Decision tree
model.dt <- rpart(train[, 10] ~ ., data = train[, -10])

## c) Naive bayes
model.nb <- naiveBayes(train[, 10] ~ ., data = train[, -10])

## d) SVM
model.svm <- svm(train[, 10] ~ ., data = train[, -10])

# 4. Evaluar y comparar el rendimiento de cada modelo con el conjunto de entrenamiento

## a) KNN
model.knn <- knn(test = train[, -10], train = train[, -10], k = k, cl = train[, 10])
confusion.matrix <- table(Observed = train[, 10], Predicted = model.knn)
eval(confusion.matrix)

## b) Decision tree
prediction <- rpart.predict(model.dt, newdata = train[, -10])
max(prediction)
which.max(prediction)


confusion.matrix <- table(Observed = train[, 10], Predicted = prediction)
eval(confusion.matrix)

## c) Naive bayes
prediction <- predict(model.nb, newdata = train[, -10])
confusion.matrix <- table(Observed = train[, 10], Predicted = prediction)
eval(confusion.matrix)

## d) SVM
prediction <- predict(model.svm, new_data = train[, -10])
confusion.matrix <- table(Observed = train[, 10], Predicted = prediction)
eval(confusion.matrix)

# 5. Evaluar y comparar rendimiento de cada modelo con el conjunto de prueba

## a) KNN
model.knn <- knn(test = test[, -10], train = train[, -10], k = k, cl = train[, 10])
confusion.matrix <- table(Observed = test[, 10], Predicted = model.knn)
eval(confusion.matrix)

## b) Decision tree
prediction <- rpart.predict(model.svm, newdata = test[, -10], )
confusion.matrix <- table(Observed = test[, 10], Predicted = prediction)
eval(confusion.matrix)

## c) Naive bayes
prediction <- predict(model.nb, newdata = test[, -10])
confusion.matrix <- table(Observed = test[, 10], Predicted = prediction)
eval(confusion.matrix)

## d) SVM
prediction <- predict(model.svm, newdata = test[, -10])
confusion.matrix <- table(Observed = test[, 10], Predicted = prediction)
eval(confusion.matrix)





