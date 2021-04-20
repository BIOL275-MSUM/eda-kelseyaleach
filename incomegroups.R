
# 2019 --------------------------------------------------------------------
alltable19 <- as_tibble(NISPUF19)

#Code to extract variables from the dataset that will be used for analysis
newtable19 <- select(alltable19, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

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

#Table for counting utd vaccines per income group in 2019
povtable19b <- na.omit(count(newtable19, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  #mutate(shortp = format(round(p, digits = 2))) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))


# 2018 --------------------------------------------------------------------


alltable18 <- as_tibble(NISPUF18)

#Code to extract variables from the dataset that will be used for analysis
newtable18 <- select(alltable18, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

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

#Table for counting utd vaccines per income group in 2019
povtable18b <- na.omit(count(newtable18, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))




# Data Concatenation ------------------------------------------------------
inctable <-full_join(povtable19b, povtable18b, by = c("Income", "n", "p", "povLab", "INCQ298A"))


upinctable <- group_by(inctable, povLab)
summarise(upinctable, average = mean(p))


# Graph -------------------------------------------------------------------


ggplot(data = povtable19b, aes(x = Income, y = p)) +
  geom_bar(stat = 'identity') +
  labs(x = "Income Group", y = "Proportion") +
  scale_y_continuous(breaks = seq(0, 0.9, 0.1), limits = c(0, 0.9), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(0.9)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  ) +
  #geom_text(aes(label = shortp), vjust = 1.5, colour = "white") +
  labs(caption="Source: CDC, NCIRD (2020), 2019 National Immunization Survey - Child.")
