library(twitteR)

tweets <- userTimeline("BarackObama",n=100)
df <- do.call("rbind",lapply(tweets, as.data.frame))
names(df)

dim(df)
attributes(df)
head(df)


plot(df$created, df$favoriteCount)

install.packages("SnowballC")
library(SnowballC)

myCorpus <- Corpus(VectorSource(df$text))
myCorpus

myCorpus <- tm_map(myCorpus,tolower)
myCorpus <- tm_map(myCorpus, removePunctuation)
myCorpus <- tm_map(myCorpus, removeNumbers)
myStopwords <- c(stopwords('english'),"available","via")
idx <- which(myStopwords =="r")
myStopwords <- myStopwords[-idx]
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)
myCorpus

writeCorpus(myCorpus, "E:\\RESEARCH\\twitter\\data\\csv")

summary(myCorpus)

?wordStem
?stemDocument
inspect(myCorpus[1:2])

memory.limit()

?Startup
?tm_map
?stopwords
?stemDocument

doc <- ("Sumitro was born in Kebumen, Central Java, on May 29, 1917, the eldest son in an aristocratic Javanese family. Soemitro was the son of Margono Djojohadikusumo, the founder of Bank Negara Indonesia and the first chief of DPAS and member of the Committee for Preparatory Work for Indonesian Independence (Badan Penyelidik Usaha Persiapan Kemerdekaan Indonesia, or BPUPKI). He spent his childhood in Java before moving to Europe, where he received his academic training, first at the prestigious Sorbonne University in Paris and later at Economische Hogeschool (the College of Economics) in Rotterdam, the Netherlands.He first won recognition as an economist at the age of 29, serving as an adviser to the Dutch delegation attending the United Nations Security Council meeting in London in 1946.")

doc
a <- stemDocument(doc, language="english")
a



a <- stopwords('en')

a



?merge
df1 <- data.frame(key = c("k1","k2"), name1 = c("a","c"),name2 = c("b","d"),name3 = c("c","s") )
df2 <- data.frame(key = c("k1","k2"), name4 = c("t","v"),name5 = c("f","s"),name6 = c("h","u") )
df1
df2
df3 <-merge(df1,df2,by="key")
df3

a <- matrix(1:45, 3,6)

install.packages('rda')
library(rda)
install.packages('mlbench')
library('mlbench')
data(BreastCancer)
summary(BreastCancer)


jajal = data("Fri May 09 07:55:12")
jajal
hari= as.POSIXct(strptime(jajal, format="%Y-%m-%d"))
hari <- strptime(jajal,  "%a, %d %b %Y %H:%M:%S %z")
hari <-as.POSIXct(jajal, format="%a %b %d %H:%M:%S %z %Y")
hari


format.twitter.date <- function(datestring, format="datetime"){
  if (format=="datetime"){
    date <- as.POSIXct(datestring, format="%a %b %d %H:%M:%S %z %Y")
  }
  if (format=="date"){
    date <- as.Date(datestring, format="%a %b %d %H:%M:%S %z %Y")
  }   
  return(date)
}

format.twitter.date(jajal,"datetime")


( str <- "Fri, 14 Jan 2011 03:01:22 +0000" )
( str <- strptime(str, "%a, %d %b %Y %H:%M:%S %z", tz = "GMT") )

( dt.gmt <- as.POSIXct(str, tz = "GMT") )
format(dt.gmt, tz = "EST", usetz = TRUE)


require("ggplot2")

CIbias <- function(truevalue, data, cilow, cihigh, PP){ 
  ppn = 1:PP 
  limits <- aes(ymax = cihigh, ymin = cilow)
  
  ciplot = qplot(ppn,data)+geom_errorbar(limits, width = 1)+geom_abline(intercept = truevalue,
                                                                        slope = 0) 
  
  true = 0  
  for(i in 1:PP){
    if(truevalue > cilow[i] & truevalue < cihigh[i]){
      true = true + 1
    } 
  }
  bias = (true / PP)*100
  return(list(ciplot, bias)) 
}



data(iris)

CIbias(6, iris[,2], iris[,2 ] - sd(iris[,2]), iris[,2] + sd(iris[,2]), 150)


df0 <- data.frame(time = factor(c("Lunch","Dinner"), levels=c("Lunch","Dinner")),
                 total_bill = c(14.89, 0))

df0

ggplot(data=df0, aes(x=time, y=total_bill)) + geom_bar(stat="identity")

# Map the time of day to different fill colors. These both have the same result.
ggplot(data=df0, aes(x=time, y=total_bill, fill=time)) + geom_bar(stat="identity")
ggplot(data=df0, aes(x=time, y=total_bill)) + geom_bar(aes(fill=time), stat="identity")



df <- data.frame(time = factor(c("Lunch","Dinner","breakfast","test"), levels=c("Lunch","Dinner","breakfast","test")),
                  total_bill = c(14.89, 0,0.5,-0.5))
# Add a black outline
ggplot(data=df, aes(x=time, y=total_bill, fill=time)) + geom_bar(colour="black", stat="identity")


# No legend, since the information is redundant
ggplot(data=df0, aes(x=time, y=total_bill, fill=time)) +
  geom_bar(colour="black", stat="identity") +
  guides(fill=FALSE)

s1 = c("a1", "b1", "a2", 'c5', 'b2', 'u8') 
b2 = c(3, 6, 1, 5, 2, 1)
d3 = c(T, F, F, T, F, T)
my_data_frame = data.frame(s1, b2, d3)
print (my_data_frame)
print(my_data_frame$b2)
tapply(my_data_frame,my_data_frame$b2,min)

df <- data.frame(A=c("a","a","b","b"),value=1:4)
df
tapply(df$value, df$A, min)


data=dnorm(100)
for(i in 1:3){
  plot(1,1,main=substitute(paste(italic('p value'), " = 0.", x, sep=""), list(x=data[i])))
}

plot(rnorm(100),main=substitute(paste(italic('p value'), " = 0.01" )))



install.packages('outliers')
library(outliers)
set.seed(1234)
y=rnorm(100)
plot(y)
boxplot.stats(y)$out


outlier(y)
outlier(y,opposite=TRUE)
rm.outlier(y)
rm.outlier(y,opposite=TRUE)
dim(y) <- c(20,5)

outlier(y)
outlier(y,logical=TRUE)
outlier(y,logical=TRUE,opposite=TRUE)
rm.outlier(y)
rm.outlier(y,opposite=TRUE)

aa<-c(1,1,2,2,3,3,4,4,5,5,6,6) 
bb<-c(56,56,33,33,53,53,20,20,63,63,9,9) 
cc<-data.frame(aa,bb) 
uniquedf <- unique(cc) 
View(uniquedf) 

row.names(uniquedf) <- NULL 
row.names(uniquedf) <- seq(nrow(uniquedf))

?read.delim2
file01<-read.table("test.txt",header=TRUE,sep=c('\t'),quote="\"",row.names=NULL)
View(file01)

file01 <- read.table("test.txt", sep = "" , header = T , nrows = 100,
                   na.strings ="", stringsAsFactors= F)
View(file01)
file01[1,]

list.files()
testx <- read.table("winzorize.csv", sep = "" , header = T , nrows = 100,
                     na.strings ="", stringsAsFactors= F)

testx

install.packages("dplyr")
library(dplyr)

test <- test %.% 
  group_by(name) %.% 
  mutate(mean_points=mean(points))

cut_point_top <- quantile(test$mean_points, 0.95)
cut_point_bottom <- quantile(test$mean_points, 0.05)

test <- test %.% 
  group_by(name) %.% 
  mutate(outlier_top = (mean_points >= cut_point_top), 
         outlier_bottom = mean_points <= cut_point_bottom) %.%
  filter(!outlier_top & ! outlier_bottom)

test <- test %.% 
  group_by(name) %.% 
  mutate(outlier_top = (mean_points >= cut_point_top), 
         outlier_bottom = mean_points <= cut_point_bottom) 

test$points <- ifelse(test$outlier_top, cut_point_top, 
                      ifelse(test$outlier_bottom, cut_point_bottom, test$points))

test


install.packages("robustHD")
library('robustHD')

set.seed(1234) 
x <- rnorm(10) 
x[1] <- x[1] * 10 
x[2] <- x[2] * 11
x[10] <- x[10] * 10
x
boxplot(x)

y <- winsorize(x)
y
boxplot(y)



m <- matrix(data=cbind(rnorm(30, 0), rnorm(30, 2), rnorm(30, 5)), nrow=30, ncol=3)


?apply
m2 <- apply(m, 1, winsorize)
m2


install.packages('wordcloud')


#text mining

rdmTweets <- userTimeline("rdatamining", n=100, cainfo="cacert.pem")
df <- do.call("rbind", lapply(rdmTweets, as.data.frame))
library(tm)
myCorpus <- Corpus(VectorSource(df$text))
myCorpus <- tm_map(myCorpus, tolower)
myCorpus <- tm_map(myCorpus, removePunctuation)
myCorpus <- tm_map(myCorpus, removeNumbers)
myStopwords <- c(stopwords('english'), "available", "via")
idx <- which(myStopwords == "r")
myStopwords <- myStopwords[-idx]
myCorpus <- tm_map(myCorpus, removeWords, myStopwords)


dictCorpus <- myCorpus
myCorpus <- tm_map(myCorpus, stemDocument)
inspect(myCorpus[1:3])
myCorpus <- tm_map(myCorpus, stemCompletion, dictionary=dictCorpus)
#after final stem
inspect(myCorpus[1:3])


myDtm <- TermDocumentMatrix(myCorpus, control = list(minWordLength = 1))
inspect(myDtm[266:270,31:40])


findFreqTerms(myDtm, lowfreq=10)
findAssocs(myDtm, 'data', 0.30)

library(wordcloud)
m <- as.matrix(myDtm)
v <- sort(rowSums(m), decreasing=TRUE)
myNames <- names(v)
k <- which(names(v)=="data")
myNames[k] <- "and"
d <- data.frame(word=myNames, freq=v)
wordcloud(d$word, d$freq, min.freq=0)


dat1 <- data.frame(
  numbers = rep(1:4, 2),
  name = rep(c("english", "korean"), each=4)
)

dat1
reshape(dat1, idvar = "name", timevar = "numbers", direction = "wide")


df1 <- reshape(df, idvar = "numbers", timevar = "name", direction = "wide")
df1

old <- "DDDDDDDDDDDDDDDDDDDDDDDD"
n <- nchar(old)
letter <- 'nnnn'
lhs <- paste0('^([a-z]{', n-3, '})([a-z]+)$')
rhs <- paste0('\\1', letter, '\\2')
gsub(lhs, rhs, old)

install.packages("stringr")
library(stringr)
hw <- "Hadley Wickham"
str_sub(hw, 1, 6)
letters

#cbind rbind kyknya perlu di bahas ni, disamping apply, sapply
x <- c(1,3,5)
y <- c(3,2,10)
cbind(x,y)

x <- list(2, "a", "b", TRUE)
x[[2]]

x <- 1:4
y <- 2:3
x+y

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 10] <- 4

getwd()
list.files()
hw1 <- read.csv("hw1_data.csv", header=TRUE)
head(hw1)
nrow(hw1)

tail(hw1,2)
hw1[47,]

sum(hw1$Ozone==NA)
sapply(hw1, function(x) sum(is.na(x))) #sum missing value

mean(hw1$Ozone,na.rm=TRUE)
summary(hw1)

#subsetting with condition
test <- subset(hw1, hw1$Ozone >30 & hw1$Temp>90)
mean(test$Solar.R)

Tmp6 <- subset(hw1,hw1$Month==6)
mean(Tmp6$Temp)
mean(subset(hw1,hw1$Month==6)$Temp)

ada <- subset(hw1$Ozone,hw1$Month==5)  #yang di subset cuman ozon doank
max(subset(hw1,hw1$Month==5)$Ozone, na.rm=TRUE)



