conjunto <- data.frame(
  Trabajo = c(10, 4, 6, 7, 7, 6, 8, 9, 2, 5, 6, 5, 3, 2, 2, 1, 8, 9, 2, 7),
  Examen = c(9, 5, 6, 7, 8, 7, 6, 9, 1, 5, 7, 6, 2, 1, 5, 5, 9, 10, 4, 6),
  Interes = c(1, 2, 1, 1, 1, 2, 2, 1, 3, 3, 3, 2, 3, 3, 2, 2, 1, 1, 3, 3)
)

nuevos <- data.frame(
  Trabajo = c(7, 4, 3),
  Examen = c(5, 7, 4)
)

library(class)
knn(train = conjunto[, -3], test = nuevos, cl = conjunto$Interes, 3)
knn(train = conjunto[, -3], test = nuevos, cl = conjunto$Interes, 9)


install.packages('e1071')
library(e1071)

iris.filtered <- iris[,c("Petal.Width","Petal.Length","Species")]
print(head(iris.filtered))


model <- naiveBayes(Species ~ ., data = iris.filtered)
print(model)


test <- data.frame(
  Petal.Width = 0.6,
  Petal.Length = 1.9
)

prediction <- predict(model, test)
print (prediction)




iris[,-1][,-1]

predict <- function (asd) {
  asdas
}

