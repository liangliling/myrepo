#install.packages("robotstxt")
library(robotstxt)
paths_allowed("https://www.amazon.co.uk/")

#install.packages("tidyverse")
library(tidyverse)
library(rvest)
library(stringr)

page <- read_html("https://www.amazon.co.uk/s?k=laptop&crid=2DXFYP7XMOUUH&sprefix=laptop%2Caps%2C101&ref=nb_sb_noss_1")
typeof(page)
class(page)
str(page)

product <- page %>% 
  html_nodes(".a-size-medium.a-text-normal") %>%
  html_text()
product

price <- page %>% 
  html_nodes(".a-price-whole") %>%
  html_text() %>%
  str_remove(".") %>%
  str_remove(",") %>%
  as.numeric()
price

product
