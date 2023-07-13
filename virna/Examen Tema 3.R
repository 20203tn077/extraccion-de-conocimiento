library(mlbench)
library(MASS)
library(ggplot2)
library(lattice)
library(caret)
library(class)
set.seed(20203077)

data(BreastCancer)

# a) Dividir el conjunto de datos en dos, 80% para entrenamiento y 20% para pruebas (5 puntos)
# b) Entrenar y evaluar el modelo. (10 puntos)
# c) Graficar el modelo con valores reales vs valores predichos y la línea de referencia. (5 puntos)


BreastCancer
Boston


Boston.sample <- sample(Boston)
Boston.train <- Boston[-sample, 500]
Boston.test <- Boston[-sample, -500]
createDataPartition(Boston)
c <- data_partition(Boston)
#
# Carga el conjunto de datos "Boston" de la librería ‘MASS’, utilizando las medv como variable independiente, construye un modelo de regresión en R, para predecir los costos facturados tomando en cuenta lo siguiente:
# a) Dividir el conjunto de datos en dos, 80% para entrenamiento y 20% para pruebas (5 puntos)
# b) Entrenar y evaluar el modelo. (10 puntos)
# c) Graficar el modelo con valores reales vs valores predichos y la línea de referencia. (5 puntos)
#
Boston$medv





medv




# a) Dividir el conjunto de datos en conjunto de entrenamiento y conjunto de prueba. (5 puntos)
train.indexes <- createDataPartition(BreastCancer$Class, times = 1, p = 0.7, list = FALSE)
train.data <- BreastCancer[train.indexes, ]
test.data <- BreastCancer[-train.indexes, ]

test.data["Class",]

# b) Aplica el algoritmo de KNN al conjunto de entrenamiento, evalúa su rendimiento utilizando métricas. (10 puntos)
help(knn3)
k <- 5  # Número de vecinos a considerar
model <- knn(train = train_data$features, test = test_data$features, cl = train_data$target, k = k)

# Evaluar el rendimiento del modelo KNN
confusion_matrix <- table(observado = test_data$target, predicho = knn_model)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)
precision <- confusion_matrix[2, 2] / sum(confusion_matrix[, 2])
recall <- confusion_matrix[2, 2] / sum(confusion_matrix[2, ])
f1_score <- 2 * (precision * recall) / (precision + recall)

# Mostrar las métricas de evaluación
print(confusion_matrix)
print(paste("Accuracy:", accuracy))
print(paste("Precision:", precision))
print(paste("Recall:", recall))
print(paste("F1-score:", f1_score))
model <- knn3()
confusionMatrix()
svn
# c) Implementa una validación cruzada para evaluar el rendimiento con diferentes valores de k. (10 puntos)

# d) Entrena un modelo de árbol de decisión utilizando tu conjunto de datos de entrenamiento y visualiza el árbol resultante. (10 puntos)

# e) Utilizando el algoritmo SVM, clasifica el conjunto de datos de prueba y evalúa el rendimiento del modelo utilizando la matriz de confusión. (15 puntos)


a) Dividir el conjunto de datos en conjunto de entrenamiento y conjunto de prueba:

R
Copy code
# Cargar librerías
library(caret)

# Cargar conjunto de datos de ejemplo (datos simulados)
data <- data.frame(
features = matrix(rnorm(1000), ncol = 10),
target = sample(c("maligno", "benigno"), size = 100, replace = TRUE)
)

b) Aplicar el algoritmo de KNN al conjunto de entrenamiento y evaluar su rendimiento utilizando métricas:

R
Copy code
# Cargar librería


# Entrenar el modelo KNN

c) Implementar una validación cruzada para evaluar el rendimiento con diferentes valores de k:

R
Copy code
# Cargar librería
library(caret)

# Definir el esquema de validación cruzada
folds <- createFolds(train_data$target, k = 5, list = TRUE, returnTrain = FALSE)

# Realizar validación cruzada para diferentes valores de k
k_values <- c(3, 5, 7)  # Valores de k a probar
cv_results <- lapply(k_values, function(k) {
accuracy_values <- c()
for (i in 1:length(folds)) {
train_indices <- unlist(folds[-i])
cv_train_data <- train_data[train_indices, ]
cv_test_data <- train_data[folds[[i]], ]

cv_knn_model <- knn(train = cv_train_data$features, test = cv_test_data$features,
cl = cv_train_data$target, k = k)

cv_confusion_matrix <- table(observado = cv_test_data$target, predicho = cv_knn_model)
cv_accuracy <- sum(diag(cv_confusion_matrix)) / sum(cv_confusion_matrix)
accuracy_values <- c(accuracy_values, cv_accuracy)
}

mean_accuracy <- mean(accuracy_values)
return(mean_accuracy)
})

# Mostrar resultados de validación cruzada
cv_results_df <- data.frame(k = k_values, accuracy = unlist(cv_results))
print(cv_results_df)
d) Entrenar un modelo de árbol de decisión utilizando el conjunto de datos de entrenamiento y visualizar el árbol resultante:

R
Copy code
# Cargar librería
library(rpart)

# Entrenar un modelo de árbol de decisión
decision_tree <- rpart(target ~ ., data = train_data, method = "class")

# Visualizar el árbol resultante
plot(decision_tree)
text(decision_tree, use.n = TRUE, all = TRUE, cex = 0.8)
e) Utilizar el algoritmo SVM, clasificar el conjunto de datos de prueba y evaluar el rendimiento del modelo utilizando la matriz de confusión:

R
Copy code
# Cargar librería
library(e1071)

# Entrenar un modelo SVM
svm_model <- svm(target ~ ., data = train_data)

# Clasificar el conjunto de datos de prueba
svm_predictions <- predict(svm_model, newdata = test_data)

# Evaluar el rendimiento del modelo SVM
svm_confusion_matrix <- table(observado = test_data$target, predicho = svm_predictions)
print(svm_confusion_matrix)
Recuerda que estos ejemplos utilizan datos simulados y las métricas de evaluación se calculan de manera ficticia. Para aplicar estas técnicas a tu conjunto de datos "BreastCancer", asegúrate de cargar y preparar los datos correctamente antes de aplicar los pasos mencionados.






c <- 1















> muestra <- sample(150,100)
> head(muestra)
[1] 127 107  53  37  27 108
> muestra <- sample(150,100)
> head(muestra)
[1] 131  24  48 110  96  19
> set.seed(56) # dejar la muestra de forma fija
> train.Data <- data[muestra, -5]
> train.DataOutput <- data[muestra,5]
> head(train.Data)

> head(train.DataOutput)
[1] virginica  setosa     setosa     virginica  versicolor setosa
Levels: setosa versicolor virginica
> test.Data <- data[-muestra,-5]
> test.Data.Output <- data[-muestra,5]
> library(class)
> test.Output.knn <- knn(train = train.Data, test = test.Data, cl = train.DataOutput, k = 3)
> test.Output.knn
 [1] setosa     setosa     setosa     setosa     setosa
 [6] setosa     setosa     setosa     setosa     setosa
[11] setosa     setosa     setosa     setosa     versicolor
[16] versicolor versicolor versicolor versicolor versicolor
[21] versicolor virginica  versicolor versicolor versicolor
[26] versicolor versicolor versicolor versicolor versicolor
[31] virginica  virginica  virginica  versicolor virginica
[36] virginica  virginica  virginica  virginica  virginica
[41] virginica  virginica  virginica  virginica  versicolor
[46] virginica  virginica  virginica  virginica  virginica
Levels: setosa versicolor virginica
> # quiero saber que tan preciso fue este modelo
> mean(test.Output.knn== test.Data.Output)
[1] 0.94
> # generar matriz de confusión
> tt <- table(test.Output.knn, test.Data.Output)
> confusionMatrix(tt)
Error in confusionMatrix(tt) : could not find function "confusionMatrix"
> confusionMatrix(tt)
Error in confusionMatrix(tt) : could not find function "confusionMatrix"
> library(caret)
Loading required package: ggplot2
Want to understand how all the pieces fit together? Read R
for Data Science: https://r4ds.had.co.nz/
Loading required package: lattice
Warning message:
package ‘caret’ was built under R version 4.3.1
> confusionMatrix(tt)
Confusion Matrix and Statistics

               test.Data.Output
test.Output.knn setosa versicolor virginica
     setosa         14          0         0
     versicolor      0         15         2
     virginica       0          1        18

Overall Statistics

               Accuracy : 0.94
                 95% CI : (0.8345, 0.9875)
    No Information Rate : 0.4
    P-Value [Acc > NIR] : 8.745e-16

                  Kappa : 0.9092

 Mcnemar's Test P-Value : NA

Statistics by Class:

                     Class: setosa Class: versicolor
Sensitivity                   1.00            0.9375
Specificity                   1.00            0.9412
Pos Pred Value                1.00            0.8824
Neg Pred Value                1.00            0.9697
Prevalence                    0.28            0.3200
Detection Rate                0.28            0.3000
Detection Prevalence          0.28            0.3400
Balanced Accuracy             1.00            0.9393
                     Class: virginica
Sensitivity                    0.9000
Specificity                    0.9667
Pos Pred Value                 0.9474
Neg Pred Value                 0.9355
Prevalence                     0.4000
Detection Rate                 0.3600
Detection Prevalence           0.3800
Balanced Accuracy              0.9333
> test.Output.knn <- knn(train = train.Data, test = test.Data, cl = train.DataOutput, k = 32)
> mean(test.Output.knn== test.Data.Output)
[1] 0.94
> k <- 1:50
> resultado <- data.frame(k, precision = 0)
> resultado
    k precision
1   1         0
2   2         0
3   3         0
4   4         0
5   5         0
6   6         0
7   7         0
8   8         0
9   9         0
10 10         0
11 11         0
12 12         0
13 13         0
14 14         0
15 15         0
16 16         0
17 17         0
18 18         0
19 19         0
20 20         0
21 21         0
22 22         0
23 23         0
24 24         0
25 25         0
26 26         0
27 27         0
28 28         0
29 29         0
30 30         0
31 31         0
32 32         0
33 33         0
34 34         0
35 35         0
36 36         0
37 37         0
38 38         0
39 39         0
40 40         0
41 41         0
42 42         0
43 43         0
44 44         0
45 45         0
46 46         0
47 47         0
48 48         0
49 49         0
50 50         0
> for(n in k){}
> for(n in k){
+     test.Output.knn <- knn(train = train.Data,
+                            test = test.Data,
+                            cl = train.Data.Output,
+                            k = n)
+     resultado$precision[n] <- mean (test.Output.knn == test.Data.Output)
+ }
Error: object 'train.Data.Output' not found
> for(n in k){
+     test.Output.knn <- knn(train = train.Data,
+                            test = test.Data,
+                            cl = train.DataOutput,
+                            k = n)
+     resultado$precision[n] <- mean (test.Output.knn == test.Data.Output)
+ }
> resultado
    k precision
1   1      0.94
2   2      0.92
3   3      0.94
4   4      0.94
5   5      0.94
6   6      0.92
7   7      0.92
8   8      0.94
9   9      0.94
10 10      0.92
11 11      0.94
12 12      0.94
13 13      0.94
14 14      0.96
15 15      0.92
16 16      0.92
17 17      0.94
18 18      0.92
19 19      0.92
20 20      0.94
21 21      0.92
22 22      0.94
23 23      0.92
24 24      0.94
25 25      0.94
26 26      0.94
27 27      0.94
28 28      0.92
29 29      0.92
30 30      0.94
31 31      0.94
32 32      0.94
33 33      0.94
34 34      0.94
35 35      0.94
36 36      0.94
37 37      0.90
38 38      0.92
39 39      0.90
40 40      0.92
41 41      0.90
42 42      0.90
43 43      0.90
44 44      0.90
45 45      0.90
46 46      0.90
47 47      0.90
48 48      0.90
49 49      0.90
50 50      0.90
> for(n in k){
+     test.Output.knn <- knn(train = train.Data,
+                            test = test.Data,
+                            cl = train.Data.Output,
+                            k = n)
+     resultado$precision[n] <- mean (test.Output.knn == test.Data.Output)
+ }
Error: object 'train.Data.Output' not found
> for(n in k){
+     test.Output.knn <- knn(train = train.Data,
+                            test = test.Data,
+                            cl = train.DataOutput,
+                            k = n)
+     resultado$precision[n] <- mean (test.Output.knn == test.Data.Output)
+ }
> print(ggplot() + aes(resultado$k, resultado$precision) + geom_line())
> for(n in k){
+     test.Output.knn <- knn(train = train.Data,
+                            test = test.Data,
+                            cl = train.DataOutput,
+                            k = n)
+     resultado$precision[n] <- mean (test.Output.knn == test.Data.Output)
+ }
> print(ggplot() + aes(resultado$k, resultado$precision) + geom_line())
```

# Knn

```r
> library(caret)
> data <- iris
> head(data)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
> muestra <- sample(150,100)
> train.Data <- data[muestra,] #100 datos y se guardan las 5 columnas
> test.Data <- data[-muestra,] #guardo 50 datos faltantes
> knnEntrenamiento <- train(Species ~ ., data = train.Data, method = "knn", tuneLength = 30)
> class(knnEntrenamiento)
[1] "train"         "train.formula"
> knnEntrenamiento
k-Nearest Neighbors

100 samples
  4 predictor
  3 classes: 'setosa', 'versicolor', 'virginica'

No pre-processing
Resampling: Bootstrapped (25 reps)
Summary of sample sizes: 100, 100, 100, 100, 100, 100, ...
Resampling results across tuning parameters:

  k   Accuracy   Kappa
   5  0.9410450  0.9103731
   7  0.9486149  0.9218655
   9  0.9468953  0.9192326
  11  0.9478231  0.9204914
  13  0.9448148  0.9159502
  15  0.9387382  0.9067341
  17  0.9397153  0.9080268
  19  0.9313956  0.8954638
  21  0.9261429  0.8874923
  23  0.9217683  0.8808369
  25  0.9207780  0.8793854
  27  0.9166219  0.8731147
  29  0.9164320  0.8725651
  31  0.9244028  0.8847899
  33  0.9235593  0.8837064
  35  0.9144845  0.8701357
  37  0.9080695  0.8603489
  39  0.9036489  0.8537931
  41  0.8986065  0.8459143
  43  0.8885890  0.8308705
  45  0.8828797  0.8223616
  47  0.8747099  0.8095859
  49  0.8635562  0.7917797
  51  0.8488518  0.7701042
  53  0.8212632  0.7316215
  55  0.7876345  0.6826825
  57  0.7609080  0.6434835
  59  0.7141208  0.5741980
  61  0.6750937  0.5156407
  63  0.6625116  0.4969270

Accuracy was used to select the optimal model using the
 largest value.
The final value used for the model was k = 7.
> # para graficarlo
> plot(knnEntrenamiento)
> # Validación cruzada, solo parte la muestra de los datos en 5 partes y esas partes las utiliza como prueba. Dividirlo para generar el modelo y probarlo dentro del mismo modelo
> ctrl <- trainControl(method = "cv", number = 5)
> knnEntrendo.ctrl <- train(Species ~ ., data = train.Data, method = "knn", tuneLength = 30, trControl = ctrl)
> knnEntrendo.ctrl
k-Nearest Neighbors

100 samples
  4 predictor
  3 classes: 'setosa', 'versicolor', 'virginica'

No pre-processing
Resampling: Cross-Validated (5 fold)
Summary of sample sizes: 80, 80, 80, 80, 80
Resampling results across tuning parameters:

  k   Accuracy  Kappa
   5  0.93      0.89473684
   7  0.94      0.90977444
   9  0.94      0.90977444
  11  0.94      0.90977444
  13  0.94      0.90977444
  15  0.93      0.89473684
  17  0.92      0.87969925
  19  0.91      0.86466165
  21  0.92      0.87969925
  23  0.93      0.89473684
  25  0.93      0.89473684
  27  0.90      0.84962406
  29  0.91      0.86466165
  31  0.90      0.84962406
  33  0.90      0.84962406
  35  0.89      0.83458647
  37  0.89      0.83458647
  39  0.88      0.81954887
  41  0.88      0.81954887
  43  0.87      0.80451128
  45  0.87      0.80451128
  47  0.86      0.78947368
  49  0.76      0.63555140
  51  0.61      0.40134855
  53  0.55      0.30769231
  55  0.56      0.32307692
  57  0.52      0.26153846
  59  0.41      0.09230769
  61  0.39      0.06153846
  63  0.39      0.06153846

Accuracy was used to select the optimal model using the
 largest value.
The final value used for the model was k = 13.
> plot(knnEntrendo.ctrl)
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/a5db7873-74ac-45cd-b51c-cec4a4665e68/Untitled.png)

```r
> head(data)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
> # normalizar los datos para que estén en los mismos valores, se hace un ajuste de los datos
> ?preProcess
> knnEntrenado.prep <- train(Species ~ ., data = train.Data, method = "knn", tuneLength = 30, trControl = ctrl, preProcess = c("center","scale"))
> knnEntrenado.prep
k-Nearest Neighbors

100 samples
  4 predictor
  3 classes: 'setosa', 'versicolor', 'virginica'

Pre-processing: centered (4), scaled (4)
Resampling: Cross-Validated (5 fold)
Summary of sample sizes: 80, 80, 80, 80, 80
Resampling results across tuning parameters:

  k   Accuracy  Kappa
   5  0.92      0.8796992
   7  0.91      0.8646617
   9  0.92      0.8796992
  11  0.93      0.8947368
  13  0.93      0.8947368
  15  0.92      0.8796992
  17  0.92      0.8796992
  19  0.93      0.8947368
  21  0.93      0.8947368
  23  0.91      0.8646617
  25  0.88      0.8195489
  27  0.89      0.8345865
  29  0.86      0.7894737
  31  0.86      0.7894737
  33  0.88      0.8195489
  35  0.83      0.7443609
  37  0.83      0.7443609
  39  0.82      0.7293233
  41  0.81      0.7142857
  43  0.82      0.7293233
  45  0.81      0.7142857
  47  0.81      0.7142857
  49  0.75      0.6216071
  51  0.67      0.4980245
  53  0.59      0.3736257
  55  0.55      0.3100411
  57  0.45      0.1551380
  59  0.46      0.1704052
  61  0.45      0.1549031
  63  0.46      0.1702877

Accuracy was used to select the optimal model using the
 largest value.
The final value used for the model was k = 11.
> knnPredict <- predict(knnEntrendo.ctrl , newdata = test.Data)
> knnPredict
 [1] setosa     setosa     setosa     setosa     setosa
 [6] setosa     setosa     setosa     setosa     setosa
[11] setosa     setosa     setosa     setosa     setosa
[16] setosa     setosa     setosa     setosa     setosa
[21] versicolor versicolor versicolor versicolor versicolor
[26] versicolor versicolor versicolor versicolor versicolor
[31] versicolor versicolor versicolor versicolor versicolor
[36] virginica  virginica  virginica  virginica  virginica
[41] virginica  virginica  virginica  virginica  virginica
[46] virginica  virginica  virginica  virginica  virginica
Levels: setosa versicolor virginica
> knnPredictProbabilidad <- predict(knnEntrendo.ctrl , newdata = test.Data, type = "prob")
> head(knnPredictProbabilidad)
  setosa versicolor virginica
1      1          0         0
2      1          0         0
3      1          0         0
4      1          0         0
5      1          0         0
6      1          0         0
> tail(knnPredictProbabilidad)
   setosa versicolor virginica
45      0 0.15384615 0.8461538
46      0 0.00000000 1.0000000
47      0 0.07692308 0.9230769
48      0 0.23076923 0.7692308
49      0 0.00000000 1.0000000
50      0 0.07692308 0.9230769
> confusionMatrix(knnPredict, test.Data$Species)
Confusion Matrix and Statistics

            Reference
Prediction   setosa versicolor virginica
  setosa         20          0         0
  versicolor      0         15         0
  virginica       0          0        15

Overall Statistics

               Accuracy : 1
                 95% CI : (0.9289, 1)
    No Information Rate : 0.4
    P-Value [Acc > NIR] : < 2.2e-16

                  Kappa : 1

 Mcnemar's Test P-Value : NA

Statistics by Class:

                     Class: setosa Class: versicolor
Sensitivity                    1.0               1.0
Specificity                    1.0               1.0
Pos Pred Value                 1.0               1.0
Neg Pred Value                 1.0               1.0
Prevalence                     0.4               0.3
Detection Rate                 0.4               0.3
Detection Prevalence           0.4               0.3
Balanced Accuracy              1.0               1.0
                     Class: virginica
Sensitivity                       1.0
Specificity                       1.0
Pos Pred Value                    1.0
Neg Pred Value                    1.0
Prevalence                        0.3
Detection Rate                    0.3
Detection Prevalence              0.3
Balanced Accuracy                 1.0
```




