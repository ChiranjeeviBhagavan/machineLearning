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
install.packages("tidyverse")

rm(list=ls(all=TRUE))


setwd("D:\\INSOFE\\TeG-Hack\\Hackathon_Medicare\\Hackathon\\Benefit\\")
#D:\\INSOFE\\TeG-Hack\\Hackathon_Medicare\\Hackathon\\Landscape
c = read.csv("D:\\INSOFE\\TeG-Hack\\Hackathon_Medicare\\Hackathon\\Landscape\\Plandata_jan18.csv",header=T,na.strings = c(NA,"?"," ","",".","NA"))



filenames <- list.files(pattern = "pbp_b.*.txt")

length(filenames)
head(filenames,21)

plan_id = c$Plan_ID

head(plan_id)

plan_id =  str_pad( plan_id, 3, pad = "0") 

c$Plan_ID = plan_id

summary(c) 

bid_id = paste0(c$Contract_ID , "_" , c$Plan_ID ,"_" , c$segment_id )

bid_id = data.frame(bid_id)
colnames(bid_id) = c("bid_id")
head(bid_id)
dim(bid_id)
c = cbind(c,bid_id)

summary(c)


uni_bid_id = unique(bid_id)
uni_bid_id = data.frame(uni_bid_id)
colnames(uni_bid_id) = c("bid_id")

head(uni_bid_id)
dim(uni_bid_id)
ex = uni_bid_id



for (i in 1:length(filenames)){
  y <- read.delim2(filenames[i], header = T, na.strings = c("?","NA"," ",NA,"","*") )

  y$pbp_a_hnumber = NULL
  y$pbp_a_plan_identifier = NULL
  y$segment_id = NULL
  y$pbp_a_ben_cov = NULL
  y$pbp_a_plan_type = NULL
  y$orgtype = NULL
  y$version = NULL
  
  uni_bid_id <- merge(uni_bid_id, y, by = "bid_id", all = T)
}

benefit_dataSet = uni_bid_id

#writeLines(colnames(uni_bid_id), sep = '\t')
#bid_id %>% distinct( bid_id , .keep_all = TRUE)



