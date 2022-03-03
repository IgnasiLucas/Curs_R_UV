table(sparrow$Sex)
sparrow$Sex <-factor(sparrow$Sex, labels= c("J", "M", "F"))
sparrow.sp1 <- sparrow[sparrow$SpeciesCode == "Sp1", ]
sparrow.sp1_tar22 <- sparrow[sparrow$SpeciesCode == "Sp1" &
                               sparrow$tarsus <= 22, ]
sparrow_juneWt <- sparrow[sparrow$Month == "June" &
                            sparrow$wt > median(sparrow$wt), ]
rm(sparrow_juneWt)

# sort y order

sparrow$tarsus
sort(sparrow$tarsus)
order(sparrow$tarsus)
sparrow.orderTarsus <- sparrow[order(sparrow$tarsus), ]
rm(sparrow.orderTarsus)
#LISTAS
sparrow.sp.list <- split(sparrow, sparrow$SpeciesCode)
sparrow.sp.list
identical(sparrow.sp1, sparrow.sp.list$Sp1)
sparrow.sp.list$Sp1$tarsus
identical(sparrow.sp1, sparrow.sp.list[[1]])
sparrow.sp.list[[1]]$tarsus
sparrow.sp.list[[1]][, 3]
lista.loca <- list(letters[1:5], matrix(rnorm(25),5), pi)
lista.loca
lista.loca <- list(letras=letters[1:5], matriz= matrix(rnorm(25),5),
                   PI = pi)
lista.loca$letras
# list-like objects
x <- rnorm(10)
y <- rnorm(12)
t.test(x, y)
T <- t.test(x, y)
class(T)
names(T)
T$p.value
T$method

# ESTADISTICA DESCRIPTIVA Y GRAFICAS

# mean() median() sd() var() summary() range() quantile()

tapply(sparrow$tarsus, sparrow$SpeciesCode, mean)
tapply(sparrow$tarsus, list(sparrow$SpeciesCode, sparrow$Sex), mean)
with(sparrow, tapply(tarsus, list(SpeciesCode, Sex, Month), mean))
with(sparrow, tapply(tarsus, list(SpeciesCode, Month,Sex), mean))
with(sparrow, tapply(tarsus, list(SpeciesCode, Month,Sex), range))
Range <- with(sparrow, tapply(tarsus, list(SpeciesCode, Month,Sex),
                              range))

