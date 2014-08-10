
#Retweet Graph in R 

# load packages
library(twitteR)
library(igraph)
library(stringr)

#Login to your tweet account in R

reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "JiefU2xYpGU0NH7EqQVVNJj9C"
consumerSecret <- "bjksuguVmejEdq4qyxlLvAxFgm9cP6T7mz7Ai0q0FIdCYr3OmF"
twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                             consumerSecret=consumerSecret,
                             requestURL=reqURL,
                             accessURL=accessURL,
                             authURL=authURL)
download.file(url="http://curl.haxx.se/ca/cacert.pem",
              destfile="cacert.pem")
twitCred$handshake(cainfo="cacert.pem")

registerTwitterOAuth(twitCred)
user <- getUser("rischanmafrur")

# Getting tweets data in english containing "SaveGaza"
dm_tweets = searchTwitter("SaveGaza", n=500, lang="en",cainfo="cacert.pem") 
setwd("C:/Users/rischan/Dropbox/RESEARCH/rischanlab.github.io")
save(dm_tweets, file="dm_tweets.Rdata")

list.files()

# Try to show the data 
head(dm_tweets,10)

# get text
dm_txt = sapply(dm_tweets, function(x) x$getText())

#processing and Identify the retweet data
# regular expressions to find retweets
grep("(RT|via)((?:\\b\\W*@\\w+)+)", dm_tweets, 
     ignore.case=TRUE, value=TRUE)

# which tweets are retweets
rt_patterns = grep("(RT|via)((?:\\b\\W*@\\w+)+)", 
                   dm_txt, ignore.case=TRUE)

# show retweets (these are the ones we want to focus on)
dm_txt[rt_patterns] 


#Collecting Who retweeted and who posted the tweets
# create list to store user names
who_retweet = as.list(1:length(rt_patterns))
who_post = as.list(1:length(rt_patterns))

# for loop
for (i in 1:length(rt_patterns))
{ 
     # get tweet with retweet entity
     twit = dm_tweets[[rt_patterns[i]]]
     # get retweet source 
     poster = str_extract_all(twit$getText(),
                              "(RT|via)((?:\\b\\W*@\\w+)+)") 
     #remove ':'
     poster = gsub(":", "", unlist(poster)) 
     # name of retweeted user
     who_post[[i]] = gsub("(RT @|via @)", "", poster, ignore.case=TRUE) 
     # name of retweeting user 
     who_retweet[[i]] = rep(twit$getScreenName(), length(poster)) 
}

# unlist
who_post = unlist(who_post)
who_retweet = unlist(who_retweet)

#Show the data who post and who retweet

head(who_post,10)
head(who_retweet,10)

#Greating Retweet Graph

# two column matrix of edges
retweeter_poster = cbind(who_retweet, who_post)

# generate graph
rt_graph = graph.edgelist(retweeter_poster)

# get vertex names
ver_labs = get.vertex.attribute(rt_graph, "name", index=V(rt_graph))



#Plot the Graph using standard plot function 

# choose some layout
glay = layout.fruchterman.reingold(rt_graph)

# plot
par(bg="gray15", mar=c(1,1,1,1))
plot(rt_graph, layout=glay,
     vertex.color="gray25",
     vertex.size=10,
     vertex.label=ver_labs,
     vertex.label.family="sans",
     vertex.shape="none",
     vertex.label.color=hsv(h=0, s=0, v=.95, alpha=0.5),
     vertex.label.cex=0.85,
     edge.arrow.size=0.8,
     edge.arrow.width=0.5,
     edge.width=3,
     edge.color=hsv(h=.95, s=1, v=.7, alpha=0.5))
# add title
title("\nTweets with 'bioinformatics':  Who retweets whom",
      cex.main=1, col.main="gray95") 
