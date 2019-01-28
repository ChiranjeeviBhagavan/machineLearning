library(gplots)
library(ROCR)

library(caret)
library(lattice)
library(ggplot2)
library(car)

library(corrplot)
library(foreign)
library(stringr)
library(dplyr)
library(tidyverse)

rm(list = ls())

setwd("D:\\INSOFE\\TeG-Hack\\final_df4\\")

data = read.delim2("final_df4.csv",sep = ";", header=T,na.strings = c(NA,"?"," ","",".","NA"))

data$pbp_b7c_copay_mc_amt_min

na <- sapply(data,function(x) sum(is.na(x)))
na <- data.frame(na, (na/nrow(data)*100))
na


data$PartC_Premium2

output = data.frame(c$State,c$County,c$bid_id, c$Organization_Name, predictionError)

names(output)=c('State','County', 'bid_id','Organization_Name', 'PredictionEnr')
dim(output)
str(output)

write.csv(output,file="output_rd.csv",row.names=FALSE)





