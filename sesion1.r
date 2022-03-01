# Tipos de datos: 

caracter <- c("a", "b", "c")
entero   <- 1:72
logico   <- c(FALSE, TRUE, FALSE, TRUE)
reales   <- c(3.1416, 0.54, 7.1, 1.0e-12)

# clases de objetos

vector   <- c(7, 7, 7, 7)
v2       <- 1:17
matriz   <- matrix(1:25, nrow = 5)

# Operadores lógicos

vector == c(7, 7, 7, 6)
vector == c(7, 7, 7, 6) & vector > 7

# Indexar vectores i matrices

matriz[3, 4]
v2[v2 < 12 & v2 > 5]

# Datos que faltan

matriz[2:3, 4:5] <- NA

# Ejercicio 1. Genera una matriz de 10 x 10 y
# selecciona la submatriz de las filas pares y
# las columnas pares.

m1 <- matrix(1:100, nrow = 10, ncol = 10, byrow = FALSE)
m2 <- m1[c(2,4,6,8,10), c(2,4,6,8,10)]
m3 <- m1[(1:10) %% 2 == 0, (1:10) %% 2 == 0]
m4 <- m1[seq(2, 10, by = 2), seq(2, 10, by = 2)]

identical(m2, m3)
identical(m3, m4)

# Ejercicio 2. Crea una matriz de 5 x 5 con 25
# de las 26 letras del vector LETTERS. (Sugerencia:
# usa un índice negativo para eliminar un elemento
# del vector).



