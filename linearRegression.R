data <- read.csv("./Database/DataFrame.csv")

EXP <- data$EXP
EMP <- data$EMP
CBH <- data$CBH
INT <- data$INT
INV <- data$INV

linCBH <- lm(formula=CBH ~ INV)
rstudent(linCBH)
summary(linCBH)

plot(INV, CBH, type = 'n', main = "Computer by Home vs. Investiment")
points(INV, CBH, col='blue')
abline(coef(linCBH)[1], coef(linCBH)[2], col='red')

linExp <- lm(formula= EXP ~ INV)
rstudent(linCBH)
summary(linCBH)

plot(INV, EXP, type = 'n', main = "Setor Exports vs. Investiment")
points(INV, EXP, col='blue')
abline(coef(linExp)[1], coef(linExp)[2], col='red')


# print(summary(linCBH))

linINT <- lm(formula=INT ~ INV)
rstudent(linINT)
summary(linINT)

plot(INV, INT, type = 'n', main = "Acess to Internet vs. Investiment")
points(INV, INT, col='blue')
abline(coef(linINT)[1], coef(linINT)[2], col='red')

# print(summary(linINT))