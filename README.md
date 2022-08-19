

Example useage: 

```
library("hansardr")

data("hansard_1800")

hansard_sample <- hansard_1800 %>%
  sample_n(100)

adj_noun_pairs_in_hansard <- extract_adj_noun_pairs(hansard_sample, "text")

adj_noun_pairs_count <- adj_noun_pairs_in_hansard %>%
  count(adj_noun_pair) %>%
  arrange(desc(n)) %>%
  slice(1:20)

ggplot(data = adj_noun_pairs_count) +
  geom_col(aes(x = reorder(adj_noun_pair, n), 
               y = n),
           fill = "steel blue") +
  coord_flip() +
  labs(title = "Examples of Adjective-Noun Pairs",
       caption = "Searching the Hansard Parliamentary Debates",
       x = "Adjective-Noun Pair",
       y = "Count") 
```

![placeholder](https://github.com/stephbuon/posextractr/blob/master/demo/rplot.png)