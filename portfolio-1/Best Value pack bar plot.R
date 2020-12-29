#Loading libraries
library(tidyverse)
library(ggplot2)
library(dplyr)
library(mosaic)
library(lubridate)
library(gcookbook)
library(MASS)
#cellplans dataplan price for diffrent companies
cellPlans = data.frame(
  c("ATT", "Sprint", "Verizon", "ATT", "Sprint",
    "Verizon", "ATT", "Sprint", "Verizon", "ATT",
    "Verizon", "Sprint", "Verizon", "ATT",
    "Verizon", "Sprint", "ATT", "ATT", "Sprint"),
  c(1, 1, 2, 3, 3, 4, 6, 6, 8, 10, 12, 12, 16, 16,
    24, 24, 25, 30, 40),
  c(30, 20, 35, 40, 30, 50, 60, 45, 70, 80, 80, 60,
    90, 90, 110, 80, 110, 135, 100))

names(cellPlans) = c("Company", "DataGB", "Price") 
head(cellPlans, 5)

#making recipes for catchy bar graph
ggplot(cellPlans, aes(x = DataGB, y = Price, fill = Company)) +
  geom_col(position = "dodge",color="black", width = 2, alpha = .5 )+
  geom_text(aes(label = DataGB), vjust = 1.5, color="Black")+
  guides(fill = guide_legend(reverse = TRUE))+
  xlab("Internet data plan in GB ")+
  ylab("Price of data in USD") +
  scale_y_continuous(breaks = seq(0,150,20))+
  scale_x_continuous(breaks = seq(0,50,5))+
  #ylim(0,140)+
  #xlim(0,50)+
  # geom_text(vjust = 1)+
  ggtitle("Best value pack, price-wise")+
  theme(
    axis.title.x = element_text(color = "Black", size = 8, face="bold"),
    axis.text.x = element_text(color = "Blue"),
    axis.title.y = element_text(color = "Black", size = 8, face="bold"),
    axis.text.y = element_text(color = "Blue"),
    plot.title = element_text(color = "Black", size = 12, face="bold")
  ) 