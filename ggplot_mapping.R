
library(tidyverse)
library(maps)

coordinates <- map_data("world")

data_19 <- read_csv('Results/deathcount_19.csv')
data_20 <- read_csv('Results/deathcount_21.csv')

data_mapping <- right_join(data_20, coordinates, by = 'region') |>
  mutate(deathcount = replace_na(deathcount, 0))

ggplot(data = data_mapping) +
  aes(x=long, y =lat, fill = deathcount, map_id = region) +
  geom_map(map = data_mapping) + 
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL) +
  labs(x = NULL, y = NULL) +
  scale_fill_continuous(low = 'pink', high = 'red') +
coord_fixed(1.3)



      