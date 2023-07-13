conjunto <- data.frame(
  Trabajo = c(10, 4, 6, 7, 7, 6, 8, 9, 2, 5, 6, 5, 3, 2, 2, 1, 8, 9, 2, 7),
  Examen = c(9, 5, 6, 7, 8, 7, 6, 9, 1, 5, 7, 6, 2, 1, 5, 5, 9, 10, 4, 6),
  Interes = c(1, 2, 1, 1, 1, 2, 2, 1, 3, 3, 3, 2, 3, 3, 2, 2, 1, 1, 3, 3)
)

nuevos <- data.frame(
  Trabajo = c(7, 4, 3),
  Examen = c(5, 7, 4)
)

distance <- c(0, 0)
for (row in 1:nrow(conjunto)) {
  set <- conjunto[row,]
  append(distance, (set$Trabajo ** 2 + set$Examen ** 2) ** (1/2))
}
distance

