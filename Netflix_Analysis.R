rm(list=ls())

library(tidyverse)
library(randomForest)
library(readxl)
#Load in data
netflix_dir<-"C:\\Users\\Cody\\SkyDrive\\DAProjects\\netflix-shows\\"
netflix_Data<-read_csv(paste(netflix_dir,"netflix_titles.csv",sep = ""))

###################################
#Remove not found IMDB movies and place in a new dataframe
###################################
imdb_data<-netflix_Data[which(netflix_Data$IMDB_rating!='Not Found'),]

###########################################
# sort imdb ratings and number of reviews
########################
Numextract <- function(string){
  unlist(regmatches(string,gregexpr("[[:digit:]]+\\.[[:digit:]]",string)))
}
ratings_reviews<-Numextract(imdb_data$IMDB_rating)
View(ratings_reviews)

#############################################
#ALternate values
#############################################
imdb_data$rating_avg<-ratings_reviews

imdb_data$IMDB_rating<-gsub("([0-9].*n )","",imdb_data$IMDB_rating)
imdb_data$IMDB_rating<-gsub(" user ratings","",imdb_data$IMDB_rating)
imdb_data$IMDB_rating<-gsub(",","",imdb_data$IMDB_rating)
imdb_data$IMDB_rating<-as.numeric(imdb_data$IMDB_rating)

names(imdb_data)[names(imdb_data) == "IMDB_rating"] <- "Reviewers"
names(imdb_data)[names(imdb_data) == "rating_avg"] <- "Score"

imdb_data$Score<-as.numeric(imdb_data$Score)

write_csv(imdb_data,"C:\\Users\\Cody\\SkyDrive\\DAProjects\\netflix-shows\\Netflix_Data.csv")
