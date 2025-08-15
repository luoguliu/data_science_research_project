library(tidyverse)

absa_neg <- tibble(read.csv('./absa/neg.csv'))
absa_neu <- tibble(read.csv('./absa/neu.csv'))
absa_pos <- tibble(read.csv('./absa/pos.csv'))



absa_neg %>% tail(5) %>% 
  gather(name, negative_score, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = negative_score, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "ABSA negative score") + theme(plot.title = element_text(hjust = 0.5))



absa_neu %>% tail(5) %>% 
  gather(name, neutral_score, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = neutral_score, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "ABSA neutral score") + theme(plot.title = element_text(hjust = 0.5))



absa_pos %>% tail(5) %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = positive_score, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "ABSA positive score") + theme(plot.title = element_text(hjust = 0.5))





sa_neg <- tibble(read.csv('./sa/neg.csv'))
sa_neu <- tibble(read.csv('./sa/neu.csv'))
sa_pos <- tibble(read.csv('./sa/pos.csv'))



sa_neg %>% tail(5) %>% 
  gather(name, negative_score, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = negative_score, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "CSA negative score") + theme(plot.title = element_text(hjust = 0.5))



sa_neu %>% tail(5) %>% 
  gather(name, neutral_score, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = neutral_score, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "CSA neutral score") + theme(plot.title = element_text(hjust = 0.5))



sa_pos %>% tail(5) %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = positive_score, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "CSA positive score") + theme(plot.title = element_text(hjust = 0.5))



cnt <- tibble(read.csv('./cnt/result.csv'))

cnt %>% tail(13) %>% 
  gather(name, count, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = count, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "frequency of each charater") + theme(plot.title = element_text(hjust = 0.5))












absa_pos %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  filter(name == "Alfred") %>% 
  ggplot(aes(x = Chapter, y = positive_score)) + 
  geom_line(linewidth = 1.5) + 
  geom_smooth() + 
  theme_bw(base_size = 20) + 
  labs(title = "ABSA positive score of Alfred", y = "Positive Score") + 
  theme(plot.title = element_text(hjust = 0.5))

absa_pos %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  filter(name == "Howard") %>% 
  ggplot(aes(x = Chapter, y = positive_score)) + 
  geom_line(linewidth = 1.5) + 
  geom_smooth() + 
  theme_bw(base_size = 20) + 
  labs(title = "ABSA positive score of Howard", y = "Positive Score") + 
  theme(plot.title = element_text(hjust = 0.5))

absa_pos %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  filter(name == "Lawrence") %>% 
  ggplot(aes(x = Chapter, y = positive_score)) + 
  geom_line(linewidth = 1.5) + 
  geom_smooth() + 
  theme_bw(base_size = 20) + 
  labs(title = "ABSA positive score of Lawrence", y = "Positive Score") + 
  theme(plot.title = element_text(hjust = 0.5))


absa_pos %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  filter(name == "Mary") %>% 
  ggplot(aes(x = Chapter, y = positive_score)) + 
  geom_line(linewidth = 1.5) + 
  geom_smooth() + 
  theme_bw(base_size = 20) + 
  labs(title = "ABSA positive score of Mary", y = "Positive Score") + 
  theme(plot.title = element_text(hjust = 0.5))

absa_pos %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  filter(name == "John") %>% 
  ggplot(aes(x = Chapter, y = positive_score)) + 
  geom_line(linewidth = 1.5) + 
  geom_smooth() + 
  theme_bw(base_size = 20) + 
  labs(title = "ABSA positive score of John", y = "Positive Score") + 
  theme(plot.title = element_text(hjust = 0.5))

absa_pos %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  filter(name == "Cynthia") %>% 
  ggplot(aes(x = Chapter, y = positive_score)) + 
  geom_line(linewidth = 1.5) + 
  geom_smooth() + 
  theme_bw(base_size = 20) + 
  labs(title = "ABSA positive score of Cynthia", y = "Positive Score") + 
  theme(plot.title = element_text(hjust = 0.5))





absa_neg %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  filter(name == "Alfred") %>% 
  ggplot(aes(x = Chapter, y = positive_score)) + 
  geom_line(linewidth = 1.5) + 
  geom_smooth() + 
  theme_bw(base_size = 20) + 
  labs(title = "ABSA negative score of Alfred") + 
  theme(plot.title = element_text(hjust = 0.5))

absa_neg %>% 
  gather(name, positive_score, Cynthia:John) %>% 
  filter(name == "Howard") %>% 
  ggplot(aes(x = Chapter, y = positive_score)) + 
  geom_line(linewidth = 1.5) + 
  geom_smooth() + 
  theme_bw(base_size = 20) + 
  labs(title = "ABSA negative score of Howard") + 
  theme(plot.title = element_text(hjust = 0.5))







pair <- tibble(read.csv('./pair/result_alfred_howard.csv'))

pair %>% tail(13) %>% 
  ggplot(aes(x = Chapter, y = Count)) + 
  geom_line(linewidth = 1.5) + 
  theme_bw(base_size = 24) + 
  labs(title = "number of paragraphs where both Alfred and Howard appear") + theme(plot.title = element_text(hjust = 0.5))

pair %>% tail(13) %>% 
  ggplot(aes(x = Chapter, y = Compound)) + 
  geom_line(linewidth = 1.5) + 
  theme_bw(base_size = 24) + 
  labs(title = "compound scores on paragraphs including both Alfred and Howard") + theme(plot.title = element_text(hjust = 0.5))




poirot_cnt <- tibble(read.csv('./poirot/cnt.csv'))

poirot_cnt %>% tail(13) %>% 
  gather(name, count, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = count, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "number of paragraphs including Poirot and the other", y = "Count") + theme(plot.title = element_text(hjust = 0.5))


poirot_compound <- tibble(read.csv('./poirot/compound.csv'))
poirot_compound %>% tail(5) %>% 
  gather(name, compound_score, Cynthia:John) %>% 
  ggplot(aes(x = Chapter, y = compound_score, colour = name)) + 
  geom_line(linewidth = 1.5) + 
  scale_color_manual(values = c("Cynthia" = "blue", "Mary" = "green", "Poirot" = "red", "Lawrence" = "black", "Howard" = "orange", "Alfred" = "magenta", "John" = "cyan")) + 
  theme_bw(base_size = 24) + 
  labs(title = "compound scores on paragraphs including Poirot and the other", y = "Compound Score") + theme(plot.title = element_text(hjust = 0.5))








































