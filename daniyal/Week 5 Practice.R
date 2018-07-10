gcts <- read.csv('commodity_trade_statistics_data.csv')
str(gcts)
summary(gcts)
# Imports of USA
DwPractice <- subset(gcts,country_or_area== 'USA' & flow=='Import' )
DwPractice
#Data Wrangling Practice
library(dplyr)
#Imports with no quantity

plotit <- DwPractice %>% 
  filter(quantity_name== 'No Quantity')

smalldata <- DwPractice %>% 
  filter(quantity_name=='No Quantity' & year== 1999 )%>% 
  arrange(trade_usd) %>% 
  arrange(desc(trade_usd))

smalldata2 <- DwPractice %>% filter(quantity_name == c('No Quanity,Weight in kilograms'),  year== 1999)
  
#trade_usd in millions
DwPractice %>% mutate(trade_usd=trade_usd/1000000)


#Data Visualization

library(ggplot2)

## Binwidth Error

hist(DwPractice$trade_usd)

ggplot(smalldata,  aes(x = trade_usd)) +
  geom_histogram()

plotit

ggplot(plotit, aes( x= category, y= weight_kg, color= flow)) + geom_point()

ggplot(smalldata2, aes(x= quantity_name, y= commodity, color= flow))+ geom_point()



