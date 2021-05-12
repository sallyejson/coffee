
library(readxl)
library(tidyverse)
df<-read_xlsx(file.choose()) #Read Data tab from Minimum-Wage-And-Starbucks-Latte.xlsx
colnames(df)
table(df$State, useNA = 'always')
length(unique(df$State))

df<-df%>%
  filter(State!="Federal") #Dropping the record showing the  federal minimum wage.
table(df$State)

summary(df)
df%>%
  filter(is.na(Total))

#Creating Tax variable
df$Tax<-df$Total-df$Subtotal
summary(df)

#Creating Tax.rate variable
df$Tax.rate<-df$Tax/df$Subtotal*100
summary(df)

table(df$City)
table(df$Capital)
df%>%
  filter(Tax.rate>13)
colnames(df)

write.csv(df, "Minimum wage and Starbucks Latte 2021.csv", row.names = FALSE)
