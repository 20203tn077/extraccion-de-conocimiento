# Con los datos del archivo ozone.csv (de la carpeta Dataset), codificar en R los siguiente:
ozone <- read.csv('../../csv/ozone.csv')

# a) Verificar si existen valores faltantes. (5 puntos)
is.na(ozone)

# b) ¿Cuantos valores faltantes existen en el  dataframe? (5 puntos)
sum(is.na(ozone))

# c) Guardar en un nuevo dataframe las observaciones que no tiene datos faltantes. (10 puntos)
no.empty.ozone <- na.exclude(ozone)
no.empty.ozone

# d) Sustituir los valores faltantes de las columnas Humidity y Temperature_ElMonte, con las técnicas de promedio y moda, respectivamente. (20 puntos)
prom <- mean(ozone$Humidity, na.rm = TRUE)
ozone$Humidity[is.na(ozone$Humidity)] <- prom

library(modeest)
mod <- mean(mfv(ozone$Temperature_ElMonte, na_rm = TRUE))
ozone$Temperature_ElMonte[is.na(ozone$Temperature_ElMonte)] <- mod

ozone

# e) Sustituir valores faltantes con la técnica de vecinos cercanos. (15 puntos)
library(DMwR2)
ozone <- knnImputation(ozone)
ozone





# Con los datos del archivo post-data.csv, codificar en R lo siguiente:
post.data <- read.csv('../../csv/post-data.csv')

# a) Visualiza mediante las gráficas de caja los valores atípicos para las columnas view y comments. (10 puntos)
boxplot(post.data$views)
boxplot(post.data$comments)

# b) De acuerdo a las estadísticas de las gráficas de caja, ¿cuántos valores atípicos tiene cada columna? (5 puntos)
length(boxplot.stats(post.data$views)$out)
length(boxplot.stats(post.data$comments)$out)


# c) Elimina los valores atípicos de ambas columnas. (15 puntos)
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]
min <- min(boxplot.stats(post.data$views)$out)
post.data$views <- post.data$views[post.data$views < min]

min <- min(boxplot.stats(post.data$comments)$out)
post.data$comments <- post.data$comments[post.data$comments < min]
min <- min(boxplot.stats(post.data$comments)$out)
post.data$comments <- post.data$comments[post.data$comments < min]
min <- min(boxplot.stats(post.data$comments)$out)
post.data$comments <- post.data$comments[post.data$comments < min]
min <- min(boxplot.stats(post.data$comments)$out)
post.data$comments <- post.data$comments[post.data$comments < min]




q1 <- quantile(post.data$views, 0.25)
q3 <- quantile(post.data$views, 0.75)
range <- q3 - q1
inferior.limit <- q1 - 1.5 * range
superior.limit <- q3 + 1.5 * range
boxplot(post.data$views[post.data$views >= inferior.limit & post.data$views <= superior.limit])