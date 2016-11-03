Merged_data <- merge(x=TIDY4_GDP_COUNTRY,y=EDSTATA, by ="CountryCode")
summary(Merged_data)
# length is 189 observations
#sort the merged data gdp.rank in ascending order
#identify the thirteenth

Merged_data <- Merged_data[order(Merged_data$GDP.MillionsofDollars),]
record13 <- Merged_data[13,1]
record13

high_oecd <- Merged_data[which(Merged_data$Income.Group=="High income: OECD"), ]
mean_high_oecd <- mean(high_oecd$GDP.Rank)
mean_high_oecd
high_nonoecd <- Merged_data[which(Merged_data$Income.Group=="High income: nonOECD"), ]
mean_high_nonoecd <- mean(high_nonoecd$GDP.Rank)
mean_high_nonoecd

library(ggplot2)

#Merged_data$GDP.MillionsofDollars y axis
#Merged_data$Income.Group


ggplot(data=Merged_data, aes(x=Merged_data$Income.Group, y=Merged_data$GDP.MillionsofDollars, fill=Merged_data$Income.Group)) +
  geom_bar(stat="identity")

low_income <- Merged_data[which(Merged_data$Income.Group=="Low income"), ]
mean_low_income <- mean(low_income$GDP.Rank)
mean_low_income

low_middle_income <- Merged_data[which(Merged_data$Income.Group=="Lower middle income"), ]
mean_low_middle_income <- mean(low_middle_income$GDP.Rank)
mean_low_middle_income

low_middle_income_lt39 <- low_middle_income[which(low_middle_income$GDP.Rank<39), ]
summary(low_middle_income_lt39)


mean_low_middle_income <- mean(low_middle_income$GDP.Rank)
mean_low_middle_income


upper_middle_income <- Merged_data[which(Merged_data$Income.Group=="Upper middle income"), ]
mean_upper_middle_income <- mean(upper_middle_income$GDP.Rank)
mean_upper_middle_income