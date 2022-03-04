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
head(sparrow.sp1)
pairs(sparrow.sp1[, 1:7])
plot(sparrow.sp1$wingcrd, sparrow.sp1$flatwing)
jitter()
with(sparrow.sp1, plot(jitter(wingcrd), jitter(flatwing)))
attach(sparrow.sp1)
plot(jitter(wingcrd), jitter(flatwing), col =Sex)
colorSex <- c("orange", "violet", "cyan")
plot(jitter(wingcrd), jitter(flatwing),
     col = colorSex[Sex])
plot(jitter(wingcrd), jitter(flatwing),
     col = colorSex[Sex], pch = 16, cex =0.6, 
     xlab ="wingcrd (mm)", ylab = "flatwing (mm)")
LR <- lm(flatwing ~ wingcrd)
abline(LR, col ="darkblue")
abline(v= mean(wingcrd), lty =3, col = "red")
points(median(wingcrd), median(flatwing), pch =17,
       col = "green", cex = 2)
detach(sparrow.sp1)

attach(sparrow.sp1)
plot(wingcrd, flatwing, col = colorSex[Sex], pch =16,
     cex=0.6, xlab = "Wincrd (mm)", ylab = "Flatwing (mm)")
LRJ <- lm(flatwing[Sex == "J"] ~ wingcrd[Sex == 1])
LRM <- lm(flatwing[Sex == "M"] ~ wingcrd[Sex == 1])
LRF <- lm(flatwing[Sex == "F"] ~ wingcrd[Sex == 1])
abline(LRJ, col = colorSex[1])
abline(LRM, col = colorSex[2])
abline(LRF, col = colorSex[3])

LM_all <-lm(flatwing ~ wingcrd*Sex + Sex) 
detach(sparrow.sp1)
mtext("Relación flat wing con wing crd por sexo")
text(55, 66, "R mola mazo", font = 3)
legend(64, 60, c("J", "M", "F"),
       col = colorSex, pch =16)
attach(sparrow.sp1)
boxplot(flatwing)
boxplot(flatwing ~ Sex)
boxplot(flatwing ~ Sex, col =colorSex)
boxplot(flatwing ~ Sex, col =colorSex,
        notch = TRUE)
hist(flatwing)
plot(density(flatwing))

par(mfrow=c(1,3))
plot(wingcrd, flatwing)
abline(LR)
boxplot(wingcrd)
boxplot(flatwing)
detach(sparrow.sp1)

attach(sparrow.sp1)
par(mfrow=c(3,1), mar=c(1,1,0.1,1))
plot(culmen[Sex == "J"], nalospi[Sex == "J"],
     col = colorSex[1])
plot(culmen[Sex == "M"], nalospi[Sex == "M"],
     col = colorSex[2])
plot(culmen[Sex == "F"], nalospi[Sex == "F"],
     col = colorSex[3])
detach(sparrow.sp1)
