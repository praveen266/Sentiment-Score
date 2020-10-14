#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(rvest)
library(dplyr)
library(RCurl)
library(sentimentr)


#* Return the sentiment score and html file
#* @param url Enter url to get sentiment
#* @post /sentiment
sentiment_score <- function(url){
  paste(unlist(html_text(html_nodes(read_html(url), 'p,h1, h2, h3'), trim = T)), collapse = "\n") %>% 
    get_sentences() %>%
    sentiment_by() %>% 
    highlight()
}
