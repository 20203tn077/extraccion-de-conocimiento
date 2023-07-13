library(NbClust)
library(factoextra)

datos1 <- read.csv('C:/Users/CC7/Documents/i20203tn077/csv/taipei_hotel1.csv')
datos2 <- read.csv('C:/Users/CC7/Documents/i20203tn077/csv/taipei_hotel2.csv')

data.scaled <- scale(datos1[,3:4])
NbClust(data.scaled, distance = 'euclidean', min.nc = 2, max.nc = 10, method = 'kmeans', index = 'alllong')

pools <- kmeans(data.scaled, 3)

fviz_cluster(pools, data = data.scaled, palette = 'Set2')
fviz_cluster(pools, data = data.scaled, ellipse.type = 'euclid', palette = 'Set2')
fviz_cluster(pools, data = data.scaled, ellipse.type = 'norm', palette = 'Set2')

datos1$district <- pools$cluster
datos2$district <- factor(datos2$district)

plot(datos1$lon, datos1$lat, col = datos1$district)
plot(datos2$lon, datos2$lat, col = datos2$district)
