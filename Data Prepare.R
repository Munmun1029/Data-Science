#importing data set

mydata <- read.csv("D:/Dataset_midterm.csv",header = TRUE, sep = ",")
mydata

#shows which column has how many missing values

colSums(is.na(mydata)) 

#data type and conversion

mydata$Blood<-c(low=1,normal=2,high=3)[mydata$Blood]  

mydata

#again checking which column has how many missing values

colSums(is.na(mydata))

#remove missing values

mydata <- na.omit(mydata) # deleting missing value rows
mydata


#removing Outliers from data set
# there are 2 abnormal value which is 58 and 71 
mydata <- mydata[-c(51,62),]
mydata


#Univariate Exploration (after data exploration)


#age

min(mydata$Age) 
max(mydata$Age)
mean(mydata$Age)
sd(mydata$Age)

#weight 

min(mydata$weight.kg.) 
max(mydata$weight.kg.)
mean(mydata$weight.kg.)
sd(mydata$weight.kg.)

#delivery_number

min(mydata$Delivery_number) 
max(mydata$Delivery_number)
mean(mydata$Delivery_number)
sd(mydata$Delivery_number)

#delivery_time

min(mydata$Delivery_time) 
max(mydata$Delivery_time)
mean(mydata$Delivery_time)
sd(mydata$Delivery_time)

#Blood

min(mydata$Blood) 
max(mydata$Blood)
mean(mydata$Blood)
sd(mydata$Blood)

#Heart

min(mydata$Heart) 
max(mydata$Heart)
mean(mydata$Heart)
sd(mydata$Heart)

#Caesarian 

min(mydata$Caesarian) 
max(mydata$Caesarian)
mean(mydata$Caesarian)
sd(mydata$Caesarian)


#summary of the data set
summary(mydata)





