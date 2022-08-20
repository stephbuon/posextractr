# posextractr

## Overview

posextractr provides methods of grammatical information extraction designed for textual analysis.

- `extract_triples()` extract subject-verb-object and subject-verb-adjective predicate triples.
- `extract_adj_noun_pairs()` extract nouns and the adjectives that depend on them.
- `extract_subj_verb_pairs()` extract subjects and their verbs. 

## Installation

Install using CRAN: 
```
install.packages("posextractr")
```

Or using GitHub: 
```
require(devtools)
install_github("stephbuon/posextractr")
```

For first time use you will need to run `posextract_install()`.
```
library("posextractr")
posextract_install()
posextract_initialize()
```

For all other times you will just need to load the library and initialize posextract. 
```
library("posextractr")
posextract_initialize()
```

## Usage

```
extract_subj_verb_pairs(corpus, col)
```

Each function takes two arguments:

- `corpus` is a data frame 
- `col` is the column within the data frame to extract triples from

## Example

```
library("posextractr")

posextract_initialize()

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