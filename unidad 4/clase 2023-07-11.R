datos <- USArrests
datos <- scale(datos)
# Transformación de datos
# Generalización
# Reescalamiento
# Normalización

# Determinar número de clusters
# Elbow(WSS, Sithin-cluster sum square)
# Silhouette, gap_stat, etc.

# factoextra
# install.packages('factoextra')
# library(factoextra)

# fviz_nbclust

fviz_nbclust(datos, kmeans, method='wss')
fviz_nbclust(datos, kmeans, method='silhouette')
fviz_nbclust(datos, kmeans, method='gap_stat')

# install.packages("NbClust")
# library(NbClust)

NbClust(datos, distance = 'euclidean', min.nc = 2, max.nc = 10, method = 'kmeans', index = 'alllong')

agrupamiento <- kmeans(datos, 2)
agrupamiento

fviz_cluster(agrupamiento, data = datos, palette = 'Set2')
fviz_cluster(agrupamiento, data = datos, ellipse.type = 'euclid', palette = 'Set2')
fviz_cluster(agrupamiento, data = datos, ellipse.type = 'norm', palette = 'Set2')

datos <- USArrests
datos$cluster <- agrupamiento$cluster

datos$cluster <- ifelse(datos$cluster == 1, 'Mas violentos',  'Menos violentos')
