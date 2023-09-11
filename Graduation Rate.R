#importing necessary libraries
library(cluster)
library(ggplot2)
library(fpc)
library(NbClust)

# importing data set 

graduation<- read.csv("D:/graduation_rate.csv")

graduation

#to know the data 

names(graduation)
head(graduation)

#scaling the dataset(to remove categorical coloum)

graduation<- scale(graduation[,-3])
graduation


#k-means clustering
#assuming k is 5

GCluster <-kmeans(graduation,centers = 5)
plotcluster(graduation,GCluster$cluster)


#clus-plot plotting 
clusplot(graduation,GCluster$cluster,color = T,
         shade = T,labels = 0,lines = 0)

# cluster contribution with percentage   
fviz_cluster(GCluster,data=graduation,
             palette=c("cyan","blue","red","green","pink"),
             geom="point",ellipse.type= "convex",ggtheme=theme_bw())

#gap statistic

gap_stat<-clusGap(graduation,FUN=kmeans,nstart=50,K.max =10,B=30)
fviz_gap_stat(gap_stat)
c2<-kmeans(graduation,centers = 5)
fviz_cluster(c2,data = graduation,
             geom="point",
             ellipse.type="convex",
             ggtheme = theme_bw())

#silhouette method
fviz_Nbclust(graduation, kmeans, method = "silhouette")

#factoextra
library(factoextra)
fviz_nbclust(graduation, kmeans, method = "wss")

#get optimal number of cluster by NbCluste

NbClust(data = graduation, diss = NULL, distance = "euclidean", min.nc = 2, max.nc = 15, 
        
        method = "kmeans", index = "all", alphaBeale = 0.1)


#applying kmeans when k=2 

k2<- kmeans(graduation,2)
k2$cluster

#k-means clustering again with optimal clustering number 2


GCluster <-kmeans(graduation,centers = 2)

plotcluster(graduation,GCluster$cluster)


#clus-plot clustering
clusplot(graduation,GCluster$cluster,color = T,
         shade = T,labels = 0,lines = 0)

# cluster contribution with percentage   
fviz_cluster(GCluster,data=graduation,
             palette=c("cyan","blue"),
             geom="point",ellipse.type= "convex",ggtheme=theme_bw())

#gap statistic

gap_stat<-clusGap(graduation,FUN=kmeans,nstart=30,K.max =10,B=30)
fviz_gap_stat(gap_stat)

c2<-kmeans(graduation,centers = 2)
fviz_cluster(c2,data = graduation,
             palette=c("cyan","pink"),
             geom="point",
             ellipse.type="norm",
             ggtheme = theme_bw())

#distance with maximum floating point
?dist

dis<-dist(graduation)
options(max.print = 1000000)
dis

#cluster centers

c3<-kmeans(graduation,centers = 2)
c3$centers

#summary of the data set

summary(graduation)





