library(tidyverse)
table2018 <- as_tibble(NISPUF18)

#Arranging levels and labels, some code from Dr. Merkord
INCQ298Alabels_tbl <- tibble(INCQ298A = INCQ298Alevels, INCQ298Alabels = INCQ298Alabels)
INCQ298Alabels_tbl
upCount <- count(NISPUF18, INCQ298A) %>%
  mutate(INCQ298A = as.double(INCQ298A)) %>%
  inner_join(INCQ298Alabels_tbl, by = "INCQ298A")
upCount

#Plot of income groups, not currently working
ggplot(data = upCount) + 
  geom_bar(mapping = aes(x = INCQ298Alabels, y = n), stat = 'identity') +
  labs(x = "Income Range ($)", y = "Frequency") +
  scale_y_continuous(breaks = seq(0, 12000, 1000), limits = c(0, 12500), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"), 
    axis.text = element_text(color = "black", size = rel(0.9)),
    axis.text.x = element_text(angle = 45, hjust = 1), 
    axis.ticks.x = element_blank()
  )

#Code to extract variables from the dataset that will be used for analysis
newtable <- select(table2018, INCPORAR, INCPORAR_I, INCPOV1, INCQ298A, P_UTDHEP, P_UTDROT_S, P_UTDHIB, P_UTDPCV, P_UTDPOL, U24_FLU_24D, P_UTDMMX, P_UTDHEPA1, P_UTDHEPA2)

#Code for labeling tables
#labs(caption="Source: CDC, NCIRD (2020), 2018 National Immunization Survey - Child.")