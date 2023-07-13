library(rpart)
library(rpart.plot)
library(caret)

iris.train <- createDataPartition(iris, 2, 70)
iris.train