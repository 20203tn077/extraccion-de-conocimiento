#Author:  Ricardo Cárdenas Guevara
#Date:    13/05/2023

# Supongamos que tienes un data frame llamado "calificaciones" que contiene las siguientes columnas:
# "Alumno": "Andres", "Marcela", "Peter", "Ana", “Luis"
# "Materia": "Matemáticas", "Historia", "Ciencias", "Inglés", "Geografía"
# "Calificación": 90, 85, 95, 80, 92
# a) Obtener los nombres de los alumnos con calificaciones superiores a 90.
# b) Ordenar el data frame por calificación descendente.

calificaciones <- data.frame(
  Alumno = c("Andres", "Marcela", "Peter", "Ana", "Luis"),
  Materia = c("Matematicas", "Historia", "Ciencias", "Ingles", "Geografia"),
  Calificacion = c(90, 85, 95, 80, 92)
)
calificaciones.filtered <- calificaciones[calificaciones$Calificacion > 90,]
calificaciones.filtered$Alumno
calificaciones[order(-calificaciones$Calificacion),]
