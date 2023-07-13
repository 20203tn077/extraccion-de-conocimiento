personas <- data.frame(
  Nombre = c('Antonio', 'Maria', 'Juan'),
  Edad = c(40, 30, 35),
  Sexo = c('M', 'F', 'M')
)
personas

cantidad.flores.especie <- summary(iris$Species)

iris.setosa <- subset(iris, iris$Species == 'setosa')
iris.setosa

desv.numericas.setosa <- data.frame(
  Sepal.Lenght = sd(iris.setosa$Sepal.Length),
  Sepal.Width = sd(iris.setosa$Sepal.Width),
  Petal.length = sd(iris.setosa$Petal.Length),
  Petal.Width = sd(iris.setosa$Petal.Width)
)

desv.anchura.petalos.setosa <- data.frame(Petal.Width = desv.numericas.setosa$Petal.Width)

desv.anchura.petalos <- data.frame(
  setosa = sd(subset(iris, iris$Species == 'setosa')$Petal.Width),
  versicolor = sd(subset(iris, iris$Species == 'versicolor')$Petal.Width),
  virginica = sd(subset(iris, iris$Species == 'virginica')$Petal.Width)
)

cantidad.flores.especie
desv.numericas.setosa
desv.anchura.petalos.setosa
desv.anchura.petalos


iris