#Data Preparation Using R

#Library
library(plyr)

#Set Working Directory
setwd("C:\\Users\\SiowHui.Chong\\Desktop\\EDS4\\Enterprise_Data_Science4_EDS4\\Project\\Data")

#Load Data from CSV
raw <- read.csv("DealershipExperience_1.csv", header = TRUE, sep = ",")

#Due to the encoding issue, i got special character (i..id) appended to the first variable in my first column, so I will rename my first column from "i...id" to "id".
names(raw)[1]<-"id"

#Remove the double quote " in string variable (feedback/comment)

raw <- as.data.frame(lapply(raw, function(x) gsub('"', "", x)))

#Select all the categorical variables

initialdf <- subset(raw, select = c(1,6:13))

#Transform all the categories to individual columns

#Create another list without the first column. Using apply loop to get the sequence of maximum value in all the rows and convert it to integer
seqlist <- apply(initialdf[-1], 1, function(x) as.integer(seq_len(max(x, na.rm = TRUE)) %in% x))

#Append NAs at the end of each row to make the lengths same in the list and combine back with the first column
replacelist <- cbind(initialdf[1], do.call(rbind, lapply(seqlist, `length<-`, max(lengths(seqlist)))))

#Replace NAs with 0
replacelist[is.na(replacelist)] <- 0

#Rename the newly created columns to v1 (for category=1), v2 (for category=2), v55 (for category=55) etc.
colnames(replacelist)[-1] <- paste0('v', 1:99)
#Remove columns without any categories
removedf <- replacelist[, colSums(replacelist != 0) > 0]  

#Merge transform data to original dataset Data to CSV
merged <- join(raw, removedf, by="id")

#Export Data to CSV
#write.table(merged, "final.csv", sep="," ,row.names = FALSE, quote = TRUE)