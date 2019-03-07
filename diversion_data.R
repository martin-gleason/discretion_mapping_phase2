# diversion data

library("tidyverse")
file <- "/Dropbox\ \(Personal\)/Documents/CORE/publish_diversion_numbers.csv"

diversion <- read_csv(file)

diversion$ZIP <- as.factor(diversion$ZIP)

srz_graph <- diversion %>% 
  group_by(SEX, RACE, ZIP) %>% 
  ggplot(aes(x = ZIP, fill = RACE)) + 
  geom_histogram(stat = "count") +
  facet_grid(~ SEX) + 
  theme(axis.text.x=element_blank())


srz_diversion <- diversion %>% 
  group_by(RACE) %>% 
  summarize(total = n(),
            min = min(total),
            max = max(total),
            mean = mean(total),
            median = median(total)) %>%
  filter(total > max)


diversion %>% 
  group_by(ZIP, total_days)


diversion %>% 
  filter(total_days == 0) %>%
  group_by(RACE) %>% 
  ungroup() %>%
  ggplot(aes(x = ZIP, fill = RACE)) + 
  geom_histogram(stat = "count") +
  facet_grid(~ SEX) +
  coord_flip()
