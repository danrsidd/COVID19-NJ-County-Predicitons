# Load map data and plotting packages
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

# Grab state data and begin to create base state map
usa <- map_data("usa")
states <- map_data("state")
nj_df <- subset(states, region == "new jersey")
counties <- map_data("county")
nj_county <- subset(counties, region == "new jersey")

# Plot base state map and county borders
nj_base <- ggplot(data = nj_df, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "black", fill = "gray")
nj_base + theme_nothing()

nj_base + theme_nothing() + 
  geom_polygon(data = nj_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA)

# Read in spreadsheet with count values (Pos/Neg Tweet Sentiments)
setwd("[INSERT FILEPATH HERE]")
nj_sent<-read.csv("NJCountyMap.csv")

# Merge datasets by county column (renamed to subregion)
njtwt <- merge(nj_county, nj_sent, by = "subregion")

# Plot Positive Tweet Sentiments Choropleth Map
nj_pos_map <- nj_base + 
  geom_polygon(data = njtwt, aes(fill = positive_sentiments), color = "white") +
  geom_polygon(color = "black", fill = NA) +
  scale_fill_gradient(low="green", high="darkgreen")+theme_bw()+ggtitle("Positive Tweet Sentiments in New Jersey, by County")

nj_pos_map + labs(fill ="# of Tweets")

# Plot Negative Tweet Sentiments Choropleth Map
nj_neg_map <- nj_base + 
  geom_polygon(data = njtwt, aes(fill = negative_sentiments), color = "white") +
  geom_polygon(color = "black", fill = NA) +
  scale_fill_gradient(low="red", high="darkred")+theme_bw()+ggtitle("Negative Tweet Sentiments in New Jersey, by County")

nj_neg_map + labs(fill ="# of Tweets")

