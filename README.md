# COVID-19 NJ County Predictions

## About The Project

This project’s main objective was to utilize Twitter sentiment analysis to predict the prominence of COVID-19 cases in each of New Jersey’s 21 counties. This project has positive implications on the way we approach outbreak identification and hints at the communal power of individual sentiments.

This project stemmed from prior  experimentation with Twitter sentiment analysis. Recognizing the potential of computational analytical power, the plethora of available libraries and APIs enabling such a methodology to be applied, and the prominence of COVID-19 around the globe, it was decided that COVID-19 tweets would be analyzed. To limit the scope of the project and determine whether sentiment analysis predictions possessed any practical viability for COVID-19 cases, this project was limited to the State of New Jersey and its 21 counties.

The following hypothesis and research questions guided this project’s research and technical development:  

**Hypothesis:** Twitter sentiments influence stock market performance during a global pandemic.  
**Research Question 1:** Are Twitter sentiments able to accurately predict stock market performance during a global pandemic?  
**Research Question 2:** Do global Twitter sentiments have a significant impact on the United States’ economic performance?  
**Research Question 3:** Do positive and negative sentiments correlate with increases or decreases in market performance?

## Built With

This project's Twitter sentiment analysis was completed using R and accompanying libraries. In this repo, you'll find the two scripts responsbile for Tweet collection, sentiment analysis, and sentiment visualizations.

* [R](https://www.r-project.org)
* [ggplot2](https://ggplot2.tidyverse.org)
* [ggmap](https://cran.r-project.org/web/packages/ggmap/ggmap.pdf)
* [Twitter API](https://developer.twitter.com/en/docs)

## Grab a Local Copy to Experiment With

Open your terminal and clone this repo
   ```sh
   git clone https://github.com/danrsidd/COVID19-NJ-County-Predicitons.git
   ```

## Usage

This project's Twitter sentiment analysis was completed using R and accompanying libraries. In this repo, you'll find the two scripts responsbile for Tweet collection, sentiment analysis, and sentiment visualizations.

The following sentiment analysis and choropleth map (heat map) scripts can be applied to any location around the globe and any topic. Read through the comments in each script and adapt according to your needs.

- CountySentimentsScript.R - This R script is reponsbile for connecting to the Twitter API, collecting tweets, refining them, calculating their sentiments, and creating sentiment visualizations in the form of bar plots.

- County_Sentiment_Choropleths.R - This R script makes use of the positive and negative sentiment counts calulated by the above script. With these counts, this script creates choropleth maps (commonly known as heat maps), to visually differentiate positive and negative sentiment densities between New Jersey counties.

## Contribute

Interested in making a contribution? Follow the steps below!

- Fork this repository
- Create your own branch (`git checkout -b contribute/ContributionName`)
- Commit your changes (`git commit -m 'Add a change'`)
- Push to the branch you created earlier (`git push origin contribute/ContributionName`)
- Start a pull request

## Link(s)

Project Link: [github.com/danrsidd/COVID19-NJ-County-Predicitons](https://github.com/danrsidd/COVID19-NJ-County-Predicitons)\
Visit the Website: [njcovidsentiments.com](https://njcovidsentiments.com)
