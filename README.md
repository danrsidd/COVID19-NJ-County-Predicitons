# COVID-19 Twitter Sentiments (NJ)
Sentiments of coronavirus Tweets (county comparisons)

Analysis and code also available at njcovidsentiments.com

These sentiment analysis and choropleth map (heat map) scripts can be applied to any location around the globe and any topic. Read through the comments in each script and adapt according to your needs.

---

This project's Twitter sentiment analysis was completed using R and accompanying libraries. In this repo, you'll find the two scripts responsbile for Tweet collection, sentiment analysis, and sentiment visualizations.

CountySentimentsScript.R - This R script is reponsbile for connecting to the Twitter API, collecting tweets, refining them, calculating their sentiments, and creating sentiment visualizations in the form of bar plots.

County_Sentiment_Choropleths.R - This R script makes use of the positive and negative sentiment counts calulated by the above script. With these counts, this script creates choropleth maps (commonly known as heat maps), to visually differentiate positive and negative sentiment densities between New Jersey counties.
