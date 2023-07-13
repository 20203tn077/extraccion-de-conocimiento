mtcars
mtcars.ordered <- mtcars[order(-mtcars$mpg),]
mtcars.cyl.filtered <- subset(mtcars, mtcars$cyl == 4 | mtcars$cyl == 6)
cars.number <- length(mtcars.cyl.filtered$cyl)
mtcars.mpg.filtered <- subset(mtcars, mtcars$mpg < 20)

# 1
mtcars.ordered
# 2
cars.number
# 3
mtcars.mpg.filtered