#Discretion Mapping Word Cloud
from <- "https://richpauloo.github.io/2017-12-29-Using-tidytext-to-make-word-clouds/"

library("tidytext")
library("tidyverse")
library("wordcloud")
source("../scripts/color_scheme.R")



file <- "/Users/marty/Dropbox (Personal)/Coding Projects/DataSets/text/discretion/discretion_mapping.txt"

discretion_outline <- read.table(file, header = FALSE, fill = TRUE)

discretion_words <- discretion_outline %>% 
  gather(key, word) %>%
  unnest_tokens(word, word) %>%
  anti_join(stop_words) %>% 
  count(word, sort = TRUE) %>%
  ungroup() 

