library(mice)
library(modeest)
library(DMwR2)
library(stats)

data <- read.csv('./csv/movies.csv')
data$VOTES <- ifelse(data$VOTES == '', NA, data$VOTES)
data$Gross <- ifelse(data$Gross == '', NA, data$Gross)

md.pattern(data)[6,7]
data.cleaned <- na.omit(data)
md.pattern(data.cleaned[6,7])

data.rating.mean <- mean(data$RATING, na.rm = TRUE)
data.votes.mode <- mfv(data$VOTES, na_rm = TRUE)
data.runtime.mean <- mean(data$RunTime, na.rm = TRUE)

data$RATING <- ifelse(is.na(data$RATING), data.rating.mean, data$RATING)
data$VOTES <- ifelse(is.na(data$VOTES), data.votes.mode, data$VOTES)
data$RunTime <- ifelse(is.na(data$RunTime), data.runtime.mean, data$RunTime)
data$VOTES <- as.numeric(gsub(',', '', data$VOTES))

data.split <- data[,3:5]

pca <- prcomp(data.split, center = TRUE, scale = TRUE)
print(pca)

data$PC1 <- PC1 <- -0.6295688 * data$RATING + 0.2034805 * data$VOTES + 0.7498259 * data$RunTime
data$PC2 <- PC2 <- -0.5017493 * data$RATING - 0.8433396 * data$VOTES - 0.1924214 * data$RunTime
data$PC3 <- PC3 <-  0.5932038 * data$RATING - 0.4973671 * data$VOTES + 0.6330365 * data$RunTime

View(data)