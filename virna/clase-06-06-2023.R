

rivers <- read.csv('C:/Users/CC7/Documents/i20203tn077/rivers.csv')
salary <- read.csv('C:/Users/CC7/Documents/i20203tn077/salary.csv')
maraton <- read.csv('C:/Users/CC7/Documents/i20203tn077/maraton_ny (1).csv')
contaminacion <- read.csv('C:/Users/CC7/Documents/i20203tn077/contaminacion.csv')

data <- rivers$V1
data

q1 <- quantile(data, 0.25)
q3 <- quantile(data, 0.75)
q1
q3
range <- q3 - q1
range
inferior.limit <- q1 - 1.5 * range
superior.limit <- q3 + 1.5 * range
inferior.limit
superior.limit
filtered.data <- data[data >= superior.limit & data <= superior.limit]
filtered.data

boxplot(rivers$V1, col = 'skyblue', frame.plot = F)
boxplot(filtered.data, col = 'skyblue', frame.plot = F)