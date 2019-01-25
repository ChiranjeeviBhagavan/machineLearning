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

setwd("D:\\INSOFE\\TeG-Hack\\final_df3\\")

data = read.delim2("final_df3.csv",sep = ";", header=T,na.strings = c(NA,"?"," ","",".","NA"))
typeof(data)
data_amout = data[,c(colnames(data)[grep("_amt",colnames(data))])]

str(data_amout)

data_amout = lapply(data_amout, as.numeric)


data_no_amount = data [,setdiff(colnames(data),names(data_amout))]
data = cbind(data_amout,data_no_amount)
dim(data)


na <- sapply(data,function(x) sum(is.na(x)))
na <- data.frame(na, (na/nrow(data)*100))
na





