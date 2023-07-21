# PCA
# Principal Component Analysis
# n-1 componentes
# Cada componentes es una función

data <- USArrests
View(data)

library(stats)
pca <- prcomp(data, center = TRUE, scale = TRUE)
data$PC1 <- PC1 <- -0.5358995 * data$Murder - 0.5831836 * data$Assault - 0.2781909 * data$UrbanPop - 0.5434321 * data$Rape
data$PC2 <- PC2 <- 0.4181809 * data$Murder + 0.1879856 * data$Assault - 0.8728062 * data$UrbanPop - 0.1673186 * data$Rape
data$PC3 <- PC3 <- -0.3412327 * data$Murder - 0.2681484 * data$Assault - 0.3780158 * data$UrbanPop + 0.8177779 * data$Rape
data$PC4 <- PC4 <- 0.64922780 * data$Murder - 0.74340748 * data$Assault + 0.13387773 * data$UrbanPop + 0.08902432 * data$Rape

