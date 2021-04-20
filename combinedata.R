library(tidyverse)

#2019
alltable19 <- as_tibble(NISPUF19)

#Code to extract variables from the dataset that will be used for analysis
newtable19 <- select(alltable19, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Function to assign appropriate poverty labels
fixPovertyLabels <- function(x) {
  if (x == 1) {"ABOVE POVERTY, > $75K"}
  else if (x == 2) {"ABOVE POVERTY, <= $75K"}
  else if (x == 3) {"BELOW POVERTY"}
}

#Table for counting utd vaccines per poverty group
povtable19 <- na.omit(count(newtable19, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter( INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2019") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2018
alltable18 <- as_tibble(NISPUF18)

#Code to extract variables from the dataset that will be used for analysis
newtable18 <- select(alltable18, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable18 <- na.omit(count(newtable18, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter( INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2018") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2017
alltable17 <- as_tibble(NISPUF17)

#Code to extract variables from the dataset that will be used for analysis
newtable17 <- select(alltable17, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable17 <- na.omit(count(newtable17, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter( INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2017") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2016
alltable16 <- as_tibble(NISPUF16)

#Code to extract variables from the dataset that will be used for analysis
newtable16 <- select(alltable16, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable16 <- na.omit(count(newtable16, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter( INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2016") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2015
alltable15 <- as_tibble(NISPUF15)

#Code to extract variables from the dataset that will be used for analysis
newtable15 <- select(alltable15, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable15 <- na.omit(count(newtable15, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter( INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2015") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2014
alltable14 <- as_tibble(NISPUF14)

#Code to extract variables from the dataset that will be used for analysis
newtable14 <- select(alltable14, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable14 <- na.omit(count(newtable14, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter( INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2014") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2013
alltable13 <- as_tibble(NISPUF13)

#Code to extract variables from the dataset that will be used for analysis
newtable13 <- select(alltable13, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable13 <- na.omit(count(newtable13, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter( INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2013") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2012
alltable12 <- as_tibble(NISPUF12)

#Code to extract variables from the dataset that will be used for analysis
newtable12 <- select(alltable12, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable12 <- na.omit(count(newtable12, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter( INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2012") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2011
alltable11 <- as_tibble(NISPUF11)

#Code to extract variables from the dataset that will be used for analysis
newtable11 <- select(alltable11, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable11 <- na.omit(count(newtable11, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter( INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2011") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2010
alltable10 <- as_tibble(NISPUF10)

#Code to extract variables from the dataset that will be used for analysis
newtable10 <- select(alltable10, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable10 <- na.omit(count(newtable10, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter( INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2010") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2009
alltable09 <- as_tibble(NISPUF09)

#Code to extract variables from the dataset that will be used for analysis
newtable09 <- select(alltable09, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable09 <- na.omit(count(newtable09, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter( INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2009") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2008
alltable08 <- as_tibble(NISPUF08)

#Code to extract variables from the dataset that will be used for analysis
newtable08 <- select(alltable08, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable08 <- na.omit(count(newtable08, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter( INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2008") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))

#2007
alltable07 <- as_tibble(NISPUF07)

#Code to extract variables from the dataset that will be used for analysis
newtable07 <- select(alltable07, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable07 <- na.omit(count(newtable07, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2007") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(INCPOV1, Income, n, p, povLab, year) %>% 
  mutate(povLab = as_factor(povLab))


#Data concatenation
yrtable <-full_join(povtable19, povtable18, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable2 <-full_join(yrtable, povtable17, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable3 <-full_join(yrtable2, povtable16, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable4 <-full_join(yrtable3, povtable15, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable5 <-full_join(yrtable4, povtable14, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable6 <-full_join(yrtable5, povtable13, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable7 <-full_join(yrtable6, povtable12, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable8 <-full_join(yrtable7, povtable11, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable9 <-full_join(yrtable8, povtable10, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable10 <-full_join(yrtable9, povtable09, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable11 <-full_join(yrtable10, povtable08, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))
yrtable12 <-full_join(yrtable11, povtable07, by = c("year", "Income", "n", "p", "povLab", "INCPOV1"))



ggplot(yrtable12, aes(x=year, y=p, fill= povLab)) + 
  geom_bar(stat="identity", position=position_dodge())+ 
  labs(caption="Source: CDC, NCIRD (2020), 20007-2019 National Immunization Survey - Child.") +
  labs(x = "Year", y = "Proportion", fill = "Poverty Status")
#Figure 1. The proportion of individuals by income group who are up-to-date on all 6 of the analyzed vaccines with respect to year.

totpovtable <- group_by(yrtable12, povLab)
povavgtable <- summarise(totpovtable, average = mean(p), sampleSize = n(), sem = average / sqrt(sampleSize), ciLower = average - 1.96 * sem, ciUpper = average + 1.96 * sem)
povavgtable2 <- mutate(povavgtable, shortavg = format(round(average, digits = 2)))

ggplot(data = povavgtable2, aes(x = povLab, y = average)) +
  geom_bar(stat = 'identity') +
  labs(x = "Poverty Status", y = "Average Proportion") +
  scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1), expand = expansion(mult = 0)) +
  theme_classic(base_size = 12) +
  theme(
    axis.title = element_text(face = "bold"),
    axis.text = element_text(color = "black", size = rel(0.9)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.ticks.x = element_blank()
  ) +
  #geom_text(aes(label = shortavg), vjust = 1.5, colour = "white") +
  labs(caption="Source: CDC, NCIRD (2020), 2019 National Immunization Survey - Child.") 
#+
#  geom_errorbar(aes(ymin = ciLower, ymax = ciUpper), width = 0.2, position = position_dodge(0.9))
