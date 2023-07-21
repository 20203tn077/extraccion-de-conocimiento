library(mice)
library(modeest)
library(DMwR2)

data <- read.csv('./csv/movies.csv')
data$VOTES <- ifelse(data$VOTES == '', NA, data$VOTES)
data$Gross <- ifelse(data$Gross == '', NA, data$Gross)

md.pattern(data)[6,7]
data.cleaned <- na.omit(data)

data.rating.mean <- mean(data$RATING, na.rm = TRUE)
data.rating.mode <- mfv(data$VOTES, na_rm = TRUE)
data.runtime.mean <- mean(data$RunTime, na.rm = TRUE)

data$RATING <- ifelse(is.na(data$RATING), data.mean, data$RATING)
data$VOTES <- ifelse(is.na(data$VOTES), data.mode, data$VOTES)
data$RunTime <- ifelse(is.na(data$RunTime), data.mean, data$RunTime)

data.split <- data[,3:5]

View(data.split)