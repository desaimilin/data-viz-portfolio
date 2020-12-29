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
#creating scatter plot for Data in GB vs Price for Individual company all together
ggplot( data=cellPlans, aes(x=DataGB, y=Price, label = Price,shape=Company, color=Company) ) +
  geom_point(size=3) +
  xlab("Internet data plan in GB ")+  #naming X and Y axis
  ylab("Price of data in USD") +
  scale_shape_manual(values = c(15,16,17)) + #allloting diffrent shapes for diffrent companies
  scale_colour_manual(values = c("Black", "green", "orange"))+ #alloting colors to identify diffrent company's plan and price in the graph
  scale_y_continuous(breaks = seq(0,150,20))+ #increasingscale numbers so audience can easily understand data
  scale_x_continuous(breaks = seq(0,50,5))+
  # Ashtetic touch to the title, font, colors and lable of graph
  ggtitle("Best value pack, price-wise")+ #giving title
  theme(
    axis.title.x = element_text(color = "Black", size = 8, face="bold"),
    axis.text.x = element_text(color = "Blue", face="bold"),
    axis.title.y = element_text(color = "Black", size = 8, face="bold"),
    axis.text.y = element_text(color = "Blue", face="bold"),
    plot.title = element_text(color = "Black", size = 8, face="bold")
  ) 