library(tidyverse)
substitutions <- read_tsv("results/substitution_type.tsv",col_names = c("ref","alt","type")) %>% mutate(across(everything(),as.factor))

# Proportion of transitions and transversions
substitutions %>%
  ggplot(aes(fill=type,x=as.factor("all substitutions"))) +
  geom_bar(position="fill") +
  xlab("") + 
  ylab("Proportion")
ggsave("results/all_substitutions.png")
substitutions %>%
  ggplot(aes(fill=type,x=ref)) +
  geom_bar(position="fill") +
  xlab("Nucleotide in reference sequence") +
  ylab("Proportion")
ggsave("results/by_nucleotide.png")

                                                                                       