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


rm(list=ls(all=TRUE))


setwd("D:\\INSOFE\\TeG-Hack\\Hackathon_Medicare\\Hackathon\\Benefit\\")
#D:\\INSOFE\\TeG-Hack\\Hackathon_Medicare\\Hackathon\\Landscape
c = read.csv("D:\\INSOFE\\TeG-Hack\\Hackathon_Medicare\\Hackathon\\Landscape\\Plandata_jan18.csv",header=T,na.strings = c(NA,"?"," ","",".","NA"))



filenames <- list.files(pattern = "pbp_b.*.txt")
filenames_exclude <- list.files(pattern = ".*vbid.txt")

length(filenames)
length(filenames_exclude)
filenames = setdiff(filenames, filenames_exclude )

head(filenames,30)

plan_id = c$Plan_ID

head(plan_id)

plan_id =  str_pad( plan_id, 3, pad = "0") 

c$Plan_ID = plan_id

dim(c) 

bid_id = paste0(c$Contract_ID , "_" , c$Plan_ID ,"_" , c$segment_id )

bid_id = data.frame(bid_id)
colnames(bid_id) = c("bid_id")
head(bid_id)
dim(bid_id)
c = cbind(c,bid_id)
c

head(c)

summary(c)

c$Annual_Drug_Deductible = as.numeric(gsub("\\$", "", c$Annual_Drug_Deductible))
c$Monthly_Consolidated_Premium_C_D = as.numeric(gsub("\\$", "", c$Monthly_Consolidated_Premium_C_D))
c$In_network_MOOP_Amount = as.numeric(gsub("\\$", "", c$In_network_MOOP_Amount))
c$PartC_Premium2 = as.numeric(gsub("\\$", "", c$PartC_Premium2))

c$PartD_Basic_Premium3 = as.numeric(gsub("\\$", "", c$PartD_Basic_Premium3))
c$PartD_Supplemental_Premium4 = as.numeric(gsub("\\$", "", c$PartD_Supplemental_Premium4))
c$PartD_Prm_oblgtn_Full_prm_assist = as.numeric(gsub("\\$", "", c$PartD_Prm_oblgtn_Full_prm_assist))
c$PartD_Total_Premium5 = as.numeric(gsub("\\$", "", c$PartD_Total_Premium5))

c$PartD_Prm_oblgtn_75_prm_assist = as.numeric(gsub("\\$", "", c$PartD_Prm_oblgtn_75_prm_assist))
c$PartD_Prm_oblgtn_50_prm_assist = as.numeric(gsub("\\$", "", c$PartD_Prm_oblgtn_50_prm_assist))
c$PartD_Prm_oblgtn_25_prm_assist = as.numeric(gsub("\\$", "", c$PartD_Prm_oblgtn_25_prm_assist))
c$PartD_Drug_Deductible = as.numeric(gsub("\\$", "", c$PartD_Drug_Deductible))


c$SCB = paste0(c$State, '_' , c$County ,'_' , c$bid_id)

c$In_network_MOOP_Amount[is.na(c$In_network_MOOP_Amount)]  = 0

head(c$Monthly_Consolidated_Premium_C_D)

(c$In_network_MOOP_Amount)

head(c$PartC_Premium2)

str(c)


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


dim(benefit_dataSet)

#writeLines(colnames(uni_bid_id), sep = '\t')
#bid_id %>% distinct( bid_id , .keep_all = TRUE)

na <- sapply(benefit_dataSet,function(x) sum(is.na(x)))
na <- data.frame(na, (na/nrow(benefit_dataSet)*100))
na

str(benefit_dataSet)


typeof(data)
data_amout = data[,c(colnames(data)[grep("_amt",colnames(data))])]

str(data_amout)

data$X = NULL;

data_amout = lapply(data_amout, as.numeric)


data_no_amount = data [,setdiff(colnames(data),names(data_amout))]
data = cbind(data_amout,data_no_amount)
colnames(data)




typeof(data)
data_pbp_b10b_bendesc_mt_al = data[,c(colnames(data)[grep("pbp_b10b_bendesc_mt_al",colnames(data))])]

data_pbp_b10b_bendesc_mt_al = data$pbp_b10b_bendesc_mt_al

for ( i in length(data_pbp_b10b_bendesc_mt_al) ):
  


  
  def digitsum(x):
  val = str(x)#10
try:
  val_at_pos = val[i-1]
if (int(val_at_pos) == 1):
  return 1
return 0
except Exception as e:
  return 0




data_pbp_b10b_bendesc_mt_al = data[,c(colnames(data)[grep("pbp_b10b_bendesc_amt_pal",colnames(data))])]

data_bendesc_amt_al = data[,c(colnames(data)[grep("pbp_b10b_bendesc_amt_pal",colnames(data))])]

head(data_bendesc_amt_al) 


