library(png)
library(dbscan)

image <- readPNG('./img/17.png', TRUE)
image <- image[, nrow(image):1]

matrix <- cbind(as.integer(which(image < -1) %% 28), which(image < -1)/28)
plot(matrix)

# Pooling with kmeans

pools <- kmeans(matrix, 2)
plot(matrix, col = pools$cluster, mar = c(1,1,1,1))
hullplot(matrix, pools)

# Pooling with dbscan

density <- dbscan(matrix, 2)
plot(matrix, col = density$cluster)
hullplot(matrix, density)

library(tm)
library(SnowballC)
news <- c(
  'XÃ³chitl GÃ¡lvez will sue AMLO for the publication of alleged contracts involving \'el perro oso\'',
  'AMLO accuses XÃ³chitl GÃ¡lvez of receiving contracts worth 1.4 billion pesos; she responds "it\'s false" and challenges him to prove it',
  'Own goal? AMLO exposes contracts between XÃ³chitl GÃ¡lvez\'s companies and the Government of Mexico during his administration',
  'Riot at Reclusorio Oriente: injuries reported due to a fight, and relatives break down the door',
  'Riot at Reclusorio Oriente in Mexico City, clash between two groups of inmates',
  'Riot reported at Reclusorio Oriente',
  'Riot at Reclusorio Oriente in Iztapalapa, Mexico City causes police mobilization: videos - UnoTV',
  'Rex Heuermann, suspect in the unsolved 2010 Gilgo Beach murders: "I didn\'t do it"',
  'Acropolis of Athens closes due to extreme heatwave - DW - 07/14/2023',
  'Protesters on Mexico-Cuernavaca road assault IvÃ¡n Aldama, reporter for ADN 40',
  'Check road closures and alternatives due to the Walk for Peace event',
  'A scare to go: Alleged food delivery workers assault young people in Cuernavaca',
  'What does "Hey Jude" by The Beatles mean in Spanish?',
  'After three years, CNBV reactivates authorization for sofipos',
  'Google will delete your photos: What to do to save them and what is the deadline?',
  '\'The interview is very violent\', Sheinbaum complains to the reporter',
  'Blockade on Mexico-Cuernavaca road today: protesters clear the way',
  'Mexican journalist and presenter Jorge Berry dies at the age of 72',
  'Groom dies on his wedding day; electrocuted in a pool',
  'Not on the CablebÃºs: Couple caught having sex in a cable car in Ecuador',
  'China executes teacher accused of poisoning students',
  'Where is Mercado Libre\'s quality control? Users ask',
  'Hacienda restores subsidy for Premium gasoline and increases support for Magna',
  'Could the Mexican peso touch 16.74 per dollar this summer? By Investing.com',
  'Amazon Prime Day: 5 devices you can buy at a huge discount',
  'This is how Earth and the Moon look from Mars',
  'Bad news: Xbox family plan temporarily ended in all regions',
  'How the actors\' strike in Hollywood will affect your favorite movies and series',
  'RBD to close their tour with a concert at Estadio Azteca',
  'Intestinal obstruction determined as the cause of Lisa Marie Presley\'s death',
  'Alcaraz demolishes Medvedev and becomes the youngest Wimbledon finalist since 2006',
  'JesÃºs DueÃ±as gets his number at Cruz Azul; what about Willer Ditta\'s registration?',
  'Jardine confirms JuliÃ¡n QuiÃ±ones\' debut against Puebla and reveals Diego ValdÃ©s\' future!',
  'The Beatles\' song that John Lennon hated because Paul McCartney wrote it',
  'This is how Asuka from Evangelion would look like if she were real, according to Artificial Intelligence',
  'Check out the fabulous car Kevin Costner used in Yellowstone',
  'Detection of time dilation in the early universe',
  '\'Oppenheimer\': who\'s who in the biopic of the creator of the atomic bomb',
  'Causes of failure in disinfection processes',
  'Company involved in child\'s death simulates competition',
  'Video of jaguar shown by AMLO is not from Mexico',
  'Monreal recounts when he was close to breaking with Morena',
  'Superpeso traded at 16.85 units this Friday',
  'Magnitude 6.5 earthquake "awakens" in southern Mexico',
  'Five phenomena to \"attack\" this Friday: extreme heat and rainfall',
  'Morena\'s survey design announces a new battlefront',
  'Women experience double the amount of sexual cyber-harassment than men',
  'Third man arrested for robbery at a jewelry store in Polanco',
  'IMSS requested 282 million pesos for elevators and did not buy them',
  'Double Congress predicts economic disaster',
  'OpenAI and its bot ChatGPT under investigation in the US',
  'Magnitude 6.5 earthquake recorded; no damages reported',
  '20 minors rescued from human trafficking',
  'Dollar price today traded at 16.89 pesos'
)

vector <- VectorSource(news)
corpus <- Corpus(vector)
corpus <- tm_map(corpus, removeWords, stopwords('english'))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stemDocument)

# NPL -> Frecuencia de términos tf - directa
#        Frecuencia indirecta de términos idf
# TF IDF

matrix <- DocumentTermMatrix(corpus)
pooling <- kmeans(dist(matrix), 5)
news[pooling$cluster == 3]