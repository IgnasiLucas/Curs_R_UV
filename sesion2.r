sparrow <- read.table("http://github.com/ibartomeus/Data/raw/master/example/SparrowsElphick.txt",
                      header =TRUE)
#read.table(file.choose(), header=TRUE)
head(sparrow)
class(sparrow)
class(sparrow[1,1])
names(sparrow)
summary(sparrow)
boxplot(sparrow$tarsus)
sparrow$tarsus[1:5]
sparrow$Month
sparrow$Month <- factor(sparrow$Month)
head(sparrow$Month)
summary(sparrow$Month)
month.name
month.name[5:10]
month_sparrow <-month.name[5:10][sparrow$Month]

sparrow$Month <- factor(month_sparrow, levels = month.name[5:10])
table(sparrow$Month)
?factor
summary(sparrow$Species)
sparrow$SpeciesCode <- factor(sparrow$SpeciesCode,
                              labels = c("Sp1", "Sp2", "Sp3"))
summary(sparrow$SpeciesCode) # equivale a table(sparrow$SpeciesCode)
table(sparrow$SpeciesCode, sparrow$Month)
