
summary(GDP_COUNTRY)
GDP_COUNTRY$X.4
TIDY_GDP_COUNTRY <- GDP_COUNTRY[-c(1, 2, 3, 4), ]

head(TIDY_GDP_COUNTRY)
summary(TIDY_GDP_COUNTRY)
#need to create variable that stores na counts for x.1 x.4-x.8

#need to change gdp rank to numeric 
#need to change gross.domestic.product.2012 to numeric

#remove all variables that contain NA's = 330 X.1, X.4, X.5, X.6, X.7, X,8

TIDY2_GDP_COUNTRY <- subset(TIDY_GDP_COUNTRY, select = c(X,Gross.domestic.product.2012,X.2,X.3))
summary(TIDY2_GDP_COUNTRY)
tail(TIDY2_GDP_COUNTRY)


# need to create variable that counts all records without ranking that will be removed
# rename variables X becomes CountryCode X.2 becomes Long.Name X.3 become GDP.Millions of Dollars
#Gross.domestic.product.2012 becomes GDP.Rank
library(tidyr)
library(dplyr)
library(countrycode)
TIDY3_GDP_COUNTRY <- rename(TIDY2_GDP_COUNTRY,CountryCode=X, GDP.Rank=Gross.domestic.product.2012, Long.Name=X.2, GDP.MillionsofDollars=X.3)
TIDY3_GDP_COUNTRY


# count of how many no ranks
norank <- sum(TIDY3_GDP_COUNTRY$GDP.Rank=="") 
norank
# create code to delete all rown that contain GDP.rank==""

TIDY3_GDP_COUNTRY <- TIDY3_GDP_COUNTRY[-which(TIDY3_GDP_COUNTRY$GDP.Rank == ""), ]
TIDY3_GDP_COUNTRY
tail(TIDY3_GDP_COUNTRY)
n<-dim(TIDY3_GDP_COUNTRY)[1]
TIDY4_GDP_COUNTRY <- TIDY3_GDP_COUNTRY[1:(n-4),]
TIDY4_GDP_COUNTRY
# need to convert to numeric from character
TIDY4_GDP_COUNTRY$GDP.Rank=as.integer(TIDY4_GDP_COUNTRY$GDP.Rank)
#need to fix , in the character

#sum(TIDY4_GDP_COUNTRY$GDP.MillionsofDollars)
TIDY4_GDP_COUNTRY$GDP.MillionsofDollars <- as.numeric(gsub(",","",TIDY4_GDP_COUNTRY$GDP.MillionsofDollars))
sapply(TIDY4_GDP_COUNTRY,mode)
TIDY4_GDP_COUNTRY$GDP.MillionsofDollars=as.integer(TIDY4_GDP_COUNTRY$GDP.MillionsofDollars)


# Tidying of the EDSTATA data set
head(EDSTATA)
tail(EDSTATA)
summary(EDSTATA)
str(EDSTATA)

EDSTATA <- EDSTATA[-which(EDSTATA$Income.Group == ""), ]
EDSTATA
