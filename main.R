# Creat my dataset
library(dplyr)
library(purrr)


# Import the Data set
computerByHome <- read.csv(file = "Database/ComputersByHome.csv")
employeement <- read.csv(file = "Database/Employeement.csv")
exports <- read.csv(file = "Database/Exports.csv")
internetAcess <- read.csv(file = "Database/InternetAcess.csv")
investment <- read.csv(file = "Database/Investiment.csv")

# creat the colluns
countryFilter <-filter(investment, TIME == '2007')['LOCATION']

collumCBH <- filter(computerByHome, TIME == '2010',computerByHome$LOCATION %in% countryFilter$LOCATION )%>% select('LOCATION', 'Value')
collumEMP <- filter(employeement, TIME == '2011',employeement$LOCATION %in% countryFilter$LOCATION ) %>% select('LOCATION', 'Value')
collumEXP <- filter(exports, TIME == '2011',exports$LOCATION %in% countryFilter$LOCATION ) %>% select('LOCATION', 'Value')
collumINT <- filter(internetAcess, TIME == '2012',internetAcess$LOCATION %in% countryFilter$LOCATION ) %>% select('LOCATION', 'Value')
collumINV <- filter(investment, TIME == '2007',investment$LOCATION %in% countryFilter$LOCATION ) %>% select('LOCATION', 'Value')

# creat the Dataframe

temp1 <- merge(collumCBH, collumEMP,by="LOCATION")
temp2 <- merge(collumEXP, collumINT,by="LOCATION")
temp3 <- merge(temp1, temp2,by="LOCATION")
df <- merge(temp3, collumINV,by="LOCATION")


colnames(df) <-c("LOCATION", "CBH","EMP", "EXP", "INT", "INV")
write.csv(df, file = "./Database/DataFrame.csv", row.names=FALSE)
source("./linearRegression.R")