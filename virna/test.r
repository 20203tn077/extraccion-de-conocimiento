meses <- c('enero', 'febrero', 'marzo')
ventas <- c(120, 10, 80)
objetivo <- c(TRUE, FALSE, TRUE)

data.frame(
  meses = meses,
  ventas = ventas,
  objetivo = objetivo
)

numeros <- 1:10
letras <- letters[1:10]

data <- data.frame(
  numeros = numeros,
  letras = letras
)

write.csv(data, 'C:/Users/CC7/Documents/data.csv')

datos2 = read.csv('C:/Users/CC7/Documents/data.csv')

datos2$X <- NULL

datos.asd = data.frame(
  numeros = 11,
  letras = 'k'
)

datos.new <- rbind(data, datos.asd)
print(datos.new)

datos.new$multiplicacion <- datos.new$numeros * 2

colnames(datos.new) <- c('col1', 'col2', 'col3')

colnames(datos.new)[colnames(datos.new) == 'col2'] <- 'Holi uwu'