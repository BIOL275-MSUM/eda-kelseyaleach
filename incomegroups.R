
# 2019 --------------------------------------------------------------------

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

# 2017 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable17b <- na.omit(count(newtable17, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2016 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable16b <- na.omit(count(newtable16, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2015 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable15b <- na.omit(count(newtable15, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2014 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable14b <- na.omit(count(newtable14, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2013 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable13b <- na.omit(count(newtable13, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2012 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable12b <- na.omit(count(newtable12, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2011 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable11b <- na.omit(count(newtable11, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2010 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable10b <- na.omit(count(newtable10, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2009 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable09b <- na.omit(count(newtable09, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2008 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable08b <- na.omit(count(newtable08, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCQ298A) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCQ298A != 77, INCQ298A != 99, count == 6) %>% 
  mutate(povLab = fixIncomeLabels(INCQ298A)) %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCQ298A, Income, n, p, povLab) %>% 
  mutate(povLab = as_factor(povLab))

# 2007 --------------------------------------------------------------------

#Table for counting utd vaccines per income group in 2019
povtable07b <- na.omit(count(newtable07, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
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
inctable1 <-full_join(inctable, povtable17b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable2 <-full_join(inctable1, povtable16b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable3 <-full_join(inctable2, povtable15b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable4 <-full_join(inctable3, povtable14b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable5 <-full_join(inctable4, povtable13b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable6 <-full_join(inctable5, povtable12b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable7 <-full_join(inctable6, povtable11b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable8 <-full_join(inctable7, povtable10b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable9 <-full_join(inctable8, povtable09b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable10 <-full_join(inctable9, povtable08b, by = c("Income", "n", "p", "povLab", "INCQ298A"))
inctable11 <-full_join(inctable10, povtable07b, by = c("Income", "n", "p", "povLab", "INCQ298A"))

upinctable <- group_by(inctable11, povLab)
incsum <- summarise(upinctable, average = mean(p))
incsum <- mutate(incsum, shortavg = format(round(average, digits = 2)))


# Graph -------------------------------------------------------------------


ggplot(data = incsum, aes(x = povLab, y = average)) +
  geom_bar(stat = 'identity') +
  labs(x = "Income Group", y = "Average Proportion") +
  scale_y_continuous(breaks = seq(0, 0.9, 0.1), limits = c(0, 0.9), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(0.9)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  ) +
  geom_text(aes(label = shortavg), vjust = 1.5, colour = "white") +
  labs(caption="Source: CDC, NCIRD (2020), 2019 National Immunization Survey - Child.")
