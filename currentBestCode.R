library(tidyverse)
table2018 <- as_tibble(NISPUF18)

#Code to extract variables from the dataset that will be used for analysis
newtable18 <- select(table2018, INCPORAR, INCPORAR_I, INCPOV1, INCQ298A, P_UTDHEP, P_UTDROT_S, P_UTDHIB, P_UTDPCV, P_UTDPOL, U24_FLU_24D, P_UTDMMX, P_UTDHEPA1, P_UTDHEPA2)

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

#Table for excluding NA's, grouping by income, excluding IDK and Refusals, and assigning income labels
heppovalt18 <- na.omit(count(newtable, INCQ298A, P_UTDHEP)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, P_UTDHEP == 1) %>% 
  mutate(Income = fixIncomeLabels(INCQ298A)) %>% 
  arrange(INCQ298A) %>% 
  mutate(Income = as_factor(Income))

#Plot of income groups and utd hep proportion
ggplot(data = heppovalt18) + 
  geom_bar(mapping = aes(x = Income, y = p), stat = 'identity') +
  labs(x = "Income Group", y = "Proportion") +
  scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"), 
    axis.text = element_text(color = "black", size = rel(0.9)),
    axis.text.x = element_text(angle = 45, hjust = 1), 
    axis.ticks.x = element_blank()
  ) + 
  labs(caption="Source: CDC, NCIRD (2020), 2018 National Immunization Survey - Child.")

#Function to assign appropriate poverty labels
fixPovertyLabels <- function(x) {
  if (x == 1) {"Above Poverty >$75K"}
  else if (x == 2) {"Above Poverty <=$75K"}
  else if (x == 3) {"Below Poverty"}
}

#Table for counting utd hep vaccines per poverty group
heppov318 <- na.omit(count(newtable, INCPOV1, P_UTDHEP)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != 4) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1))

#Plot of poverty groups and utd hep proportion
ggplot(data = heppov318) + 
  geom_bar(mapping = aes(x = povLab, y = p), stat = 'identity') +
  labs(x = "Income Group", y = "Proportion") +
  scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"), 
    axis.text = element_text(color = "black", size = rel(0.9)),
    axis.text.x = element_text(angle = 45, hjust = 1), 
    axis.ticks.x = element_blank()
  ) + 
  labs(caption="Source: CDC, NCIRD (2020), 2018 National Immunization Survey - Child.")
