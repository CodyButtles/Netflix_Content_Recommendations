# Netflix Content Recommendations

##Introduction and Setup
The insights of this project were obtained through a dataset that reflects the content of Netflix in 2018 and also a dataset of IMDB ratings. Both of these datasets I gather on Kaggle. First, I used Excel to combine the two datasets and then I read that csv into RStudio to be cleaned and organized into a final dataset. 

In RStudio I removed all rows that did not provide an average score from IMDB. I then used regular expressions to create a column for average score and the number of reviewers for each movie/TV show. After creating the final dataset in RStudio I loaded this into Tableau to create visualizations.

##Reviewers and IMDB Score

