## Cargar datos de piratas

piratas <- read.table("https://ignasilucas.github.io/Curs_R_UV/pirates.txt",
                      header = TRUE,
                      sep = "\t",
                      quote = '"')
summary(piratas)
piratas$fav.pixar

# Ejercicio: representar gráficamente la relación
# entre el peso y la altura de los piratas.

plot(piratas$height, piratas$weight)

# Dividir un data frame, aplicar una función y 
# juntar los resultados:

mean.beard.1 <- tapply(piratas$beard.length,
                       piratas$sex,
                       mean)
mean.beard.2 <- sapply(c('female', 'male', 'other'),
                     function(x) {
                       mean(piratas[piratas$sex == x,
                                    'beard.length'])
                     })

# Ahora con el paquete plyr

library(plyr)

ddply(piratas,
      c('sex','college'),
      function(x) mean(x$beard.length))

resumen <- ddply(piratas,
      c('sex', 'college'),
      function(x) {
        data.frame( mean.beard = mean(x$beard.length),
                    mean.height = mean(x$height),
                    mean.sword.time = mean(x$sword.time))
      })

# Ejercicio: Obtener una tabla resumen con el tiempo medio que
# tardan en desnefundar la espada en función del tipo de espada.

mean.time <- ddply(piratas,
                   'sword.type',
                   function(x) mean(x$sword.time))
par(mfrow = c(3,2))
d_ply(piratas,
      c('sex', 'college'),
      function(x) plot(x$grogg, x$sword.time,
                       main = paste(x[1,'sex'],
                                    x[1,'college']),
                       log = 'y'))
par(mfrow = c(1,1))

# Funciones

plot.something <- function(x, A=0, B=7){
  plot(x$grogg, x$sword.time)
  return(length(x))
} 
