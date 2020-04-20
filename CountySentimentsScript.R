# Load required R packages
library(NLP)
library(twitteR)
library(syuzhet)
library(tm)
library(ROAuth)
library(ggplot2)

setwd(dir=“XXXX”)

# Input credentials and establish Twitter connection
consumer_key <- “XXXX”
consumer_secret <- “XXXX”
access_token <- “XXXX”
access_secret <- “XXXX”
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# Search Twitter with search term, number of Tweets, language, geocode, and date range
tweets_covid <- searchTwitter("coronavirus", n=150,lang = "en", geocode = “[INSERT LAT],[INSERT LONG],[INSERT RADIUS]”, since=“DATE”, until=“DATE” )
covid_text<- covid_df$text

# Create text corpus based on the text of collected Tweets
covidCorpus <- Corpus(VectorSource(covid_df$text))

#Format text prior to analysis

# Make lowercase
covidCorpus <- tm_map(covidCorpus, content_transformer(tolower))

# Remove numbers
covidCorpus <- tm_map(covidCorpus, removeNumbers)

# Remove punctuation
covidCorpus <- tm_map(covidCorpus, removePunctuation)

# Remove whitespace
covidCorpus <- tm_map(covidCorpus, stripWhitespace)

# Read from large list of stopwords (Developed from NLTK's list of english stopwords - Github)
tweetStopwords <- readLines("stopwords-big")

# Remove stopwords from Tweets
covidCorpus <- tm_map(covidCorpus,removeWords,tweetStopwords)

# Partial processing function from CateGitau (Github)
Textprocessing <- function(x)
{gsub("http[[:alnum:]]*",'', x)
  gsub('http\\S+\\s*', '', x) ## Remove URLs
  gsub('#\\S+', '', x) ## Remove Hashtags
  gsub('@\\S+', '', x) ## Remove Mentions
  gsub('[[:cntrl:]]', '', x) ## Remove Controls and special characters
  gsub("\\d", '', x) ## Remove Controls and special characters
}
covidCorpus <- tm_map(covidCorpus,Textprocessing)

# Associate sentiments and caluclate sentiment score
mysentiment_covid<-get_nrc_sentiment((covid_text))
Sentimentscores_covid<-data.frame(colSums(mysentiment_covid[,]))

# Sentiment name formatting
names(Sentimentscores_covid)<-"Score"
Sentimentscores_covid<-cbind("sentiment"=rownames(Sentimentscores_covid),Sentimentscores_covid)
rownames(Sentimentscores_covid)<-NULL

# View the head of available sentiments
head(Sentimentscores_covid)

# Plot barplot of only positive and negatiev sentiments and add count on top of each bar
ggplot(data=Sentimentscores_covid[9:10,],aes(x=sentiment,y=Score))+geom_bar(aes(fill=sentiment),stat = "identity")+
  theme(legend.position="none")+
  xlab("Sentiment")+ylab("Score")+ggtitle("Sentiments of Tweets on Coronavirus: [Insert County Name & Date Range Here]") + geom_text(stat='identity', aes(label=Score), vjust=-1)


