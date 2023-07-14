library(NbClust)
library(factoextra)

# Transformación de datos
data.source <- read.csv('./csv/Netflix Userbase.csv')
data.source <- data.source[,-10]
data.source$Subscription.Type <- as.numeric(as.factor(data.source$Subscription.Type))
data.source$Gender <- as.numeric(as.factor(data.source$Gender))
data.source$Device <- as.numeric(as.factor(data.source$Device))
data.source$Country <- as.numeric(as.factor(data.source$Country))
data.source$Join.Date <- as.integer(as.Date(data.source$Join.Date, format('%d-%m-%y')))
data.source$Last.Payment.Date <- as.integer(as.Date(data.source$Last.Payment.Date, format('%d-%m-%y')))


data.trimmed <- data.source[,-2]
data.scaled <- scale(data.trimmed)

NbClust(data.scaled, distance = 'euclidean', min.nc = 2, max.nc = 10, method = 'kmeans', index = 'alllong')

pools <- kmeans(data.scaled, 3)

fviz_cluster(pools, data = data.scaled, palette = 'Set2')
fviz_cluster(pools, data = data.scaled, ellipse.type = 'euclid', palette = 'Set2')
fviz_cluster(pools, data = data.scaled, ellipse.type = 'norm', palette = 'Set2')

data.trimmed$Subscription.Type <- pools$cluster

plot(data.source, col = data.source$Subscription.Type)
plot(data.trimmed, col = data.trimmed$Subscription.Type)
