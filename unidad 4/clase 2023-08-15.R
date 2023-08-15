library(mice)
library(modeest)
library(DMwR2)
library(stats)

data <- read.csv('./csv/house_rental.csv')[,-8]
View(data)
data.split <- data[,2:7]

pca <- prcomp(data.split, center = TRUE, scale = TRUE)
print(pca)
summary(pca)

PC1 <- apply(pca$rotation[,1] * data, 1, sum)
PC2 <- apply(pca$rotation[,2] * data, 1, sum)
PC3 <- apply(pca$rotation[,3] * data, 1, sum)

data.pca <- data.frame(PC1, PC2, PC3)

data.price <- read.csv('./csv/house_rental.csv')
data.pca.price <- data.pca
data.pca.price$Price <- data.price$Price

model <- lm(Price~Sqft+Floor+TotalFloor+Bedroom+Living.Room+Bathroom, data.price)
model.pca <- lm(Price~PC1+PC2+PC3, data.pca.price)

model.pca
