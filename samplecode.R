library(tidyverse)
table2018 <- as_tibble(NISPUF18)

#Arranging levels and labels, some code from Dr. Merkord
INCQ298Alabels_tbl <- tibble(INCQ298A = INCQ298Alevels, INCQ298Alabels = INCQ298Alabels)
INCQ298Alabels_tbl
upCount <- count(NISPUF18, INCQ298A) %>%
  mutate(INCQ298A = as.double(INCQ298A)) %>%
  inner_join(INCQ298Alabels_tbl, by = "INCQ298A")
upCount

#Code to extract variables from the dataset that will be used for analysis
newtable <- select(table2018, INCPORAR, INCPORAR_I, INCPOV1, INCQ298A, P_UTDHEP, P_UTDROT_S, P_UTDHIB, P_UTDPCV, P_UTDPOL, U24_FLU_24D, P_UTDMMX, P_UTDHEPA1, P_UTDHEPA2)

#Code for labeling tables
#labs(caption="Source: CDC, NCIRD (2020), 2018 National Immunization Survey - Child.")

#Table for counting utd hep vaccines per income group
heppov <- na.omit(count(newtable, INCQ298A, P_UTDHEP)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, P_UTDHEP == 1)

heppov2 <- na.omit(count(newtable, INCQ298A, P_UTDHEP)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, P_UTDHEP == 1) %>% 
  inner_join(INCQ298Alabels_tbl, by = "INCQ298A")

#Function to assign appropriate income labels
fixIncomeLabels <- function(x) {
  if (x == 10) {"$35001 - $40000"}
  else if (x == 11) {"$40001 - $50000"}
  else if (x == 12) {"$50001 - $60000"}
  else if (x == 13) {"$60001 - $75000"}
  else if (x == 14) {"$75001+"}
  else if (x == 3) {"$0 - $7500"}
  else if (x == 4) {"$7501 - $10000"}
  else if (x == 5) {"$10001 - $17500"}
  else if (x == 6) {"$17501 - $20000"}
  else if (x == 7) {"$20001 - $25000"}
  else if (x == 77) {"DON'T KNOW"}
  else if (x == 8) {"$25001 - $30000"}
  else if (x == 9) {"$30001 - $35000"}
  else if (x == 99) {"REFUSED"}
}

heppovalt <- na.omit(count(newtable, INCQ298A, P_UTDHEP)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, P_UTDHEP == 1) %>% 
  mutate(Income = fixIncomeLabels(INCQ298A))

#Plot of income groups and utd hep proportion
ggplot(data = heppovalt) + 
  geom_bar(mapping = aes(x = Income, y = p), stat = 'identity') +
  labs(x = "Income Group", y = "Proportion") +
  scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"), 
    axis.text = element_text(color = "black", size = rel(0.9)),
    axis.text.x = element_text(angle = 45, hjust = 1), 
    axis.ticks.x = element_blank()
  )

#Table for counting utd hep vaccines per poverty group
heppov3 <- na.omit(count(newtable, INCPOV1, P_UTDHEP)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != 4)

#Plot of poverty groups and utd hep proportion
ggplot(data = heppov3) + 
  geom_bar(mapping = aes(x = INCPOV1, y = p), stat = 'identity') +
  labs(x = "Income Group", y = "Proportion") +
  scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"), 
    axis.text = element_text(color = "black", size = rel(0.9)),
    axis.text.x = element_text(angle = 45, hjust = 1), 
    axis.ticks.x = element_blank()
  )
