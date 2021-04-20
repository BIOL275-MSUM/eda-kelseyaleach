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
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2019") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)

#2018
alltable18 <- as_tibble(NISPUF18)

#Code to extract variables from the dataset that will be used for analysis
newtable18 <- select(alltable18, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable18 <- na.omit(count(newtable18, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2018") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)

#2017
alltable17 <- as_tibble(NISPUF17)

#Code to extract variables from the dataset that will be used for analysis
newtable17 <- select(alltable17, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable17 <- na.omit(count(newtable17, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2017") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)

#2016
alltable16 <- as_tibble(NISPUF16)

#Code to extract variables from the dataset that will be used for analysis
newtable16 <- select(alltable16, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable16 <- na.omit(count(newtable16, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2016") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)

#2015
alltable15 <- as_tibble(NISPUF15)

#Code to extract variables from the dataset that will be used for analysis
newtable15 <- select(alltable15, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable15 <- na.omit(count(newtable15, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2015") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)

#2014
alltable14 <- as_tibble(NISPUF14)

#Code to extract variables from the dataset that will be used for analysis
newtable14 <- select(alltable14, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable14 <- na.omit(count(newtable14, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2014") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)


#2013
alltable13 <- as_tibble(NISPUF13)

#Code to extract variables from the dataset that will be used for analysis
newtable13 <- select(alltable13, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable13 <- na.omit(count(newtable13, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2013") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)

#2012
alltable12 <- as_tibble(NISPUF12)

#Code to extract variables from the dataset that will be used for analysis
newtable12 <- select(alltable12, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable12 <- na.omit(count(newtable12, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6, povLab != 4) %>% 
  mutate(year = "2012") %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)

#2011
alltable11 <- as_tibble(NISPUF11)

#Code to extract variables from the dataset that will be used for analysis
newtable11 <- select(alltable11, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable11 <- na.omit(count(newtable11, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6) %>% 
  mutate(year = "2011") %>% 
  mutate(povLab = INCPOV1) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)

#2007
alltable07 <- as_tibble(NISPUF07)

#Code to extract variables from the dataset that will be used for analysis
newtable07 <- select(alltable07, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable07 <- na.omit(count(newtable07, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2007") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year) %>% 
  group_by(povLab)



yrtable <-full_join(povtable19, povtable18, by = c("year", "Income", "n", "p", "povLab"))
yrtable2 <-full_join(yrtable, povtable17, by = c("year", "n", "p", "povLab",  "Income"))
yrtable3 <-full_join(yrtable2, povtable16, by = c("year", "Income", "n", "p", "povLab"))
yrtable4 <-full_join(yrtable3, povtable15, by = c("year", "Income", "n", "p", "povLab"))
yrtable5 <-full_join(yrtable4, povtable14, by = c("year", "Income", "n", "p", "povLab"))
yrtable6 <-full_join(yrtable5, povtable13, by = c("year", "Income", "n", "p", "povLab"))
yrtable7 <-full_join(yrtable6, povtable12, by = c("year", "Income", "n", "p", "povLab"))
yrtable8 <-full_join(yrtable7, povtable11, by = c("year", "Income", "n", "p", "povLab"))

ggplot(yrtable7, aes(x=year, y=p, fill= povLab)) + 
  geom_bar(stat="identity", position=position_dodge())


# library(tidyverse)
# table2018 <- as_tibble(NISPUF18)
# 
# #Code to extract variables from the dataset that will be used for analysis
# newtable <- select(table2018, INCPORAR, INCPORAR_I, INCPOV1, INCQ298A, P_UTDHEP, P_UTDROT_S, P_UTDHIB, P_UTDPCV, P_UTDPOL, U24_FLU_24D, P_UTDMMX, P_UTDHEPA1, P_UTDHEPA2)
# 
# #Function to assign appropriate income labels
# fixIncomeLabels <- function(x) {
#   if (x == 10) {"$35001 - $40000"}
#   else if (x == 11) {"$40001 - $50000"}
#   else if (x == 12) {"$50001 - $60000"}
#   else if (x == 13) {"$60001 - $75000"}
#   else if (x == 14) {"$75001+"}
#   else if (x == 3) {"$0 - $7500"}
#   else if (x == 4) {"$7501 - $10000"}
#   else if (x == 5) {"$10001 - $17500"}
#   else if (x == 6) {"$17501 - $20000"}
#   else if (x == 7) {"$20001 - $25000"}
#   else if (x == 77) {"DON'T KNOW"}
#   else if (x == 8) {"$25001 - $30000"}
#   else if (x == 9) {"$30001 - $35000"}
#   else if (x == 99) {"REFUSED"}
# }
# 
# allpov <- na.omit(count(newtable, INCQ298A, P_UTDHEP, P_UTDROT_S, P_UTDHIB, P_UTDPCV, P_UTDPOL, U24_FLU_24D, P_UTDMMX, P_UTDHEPA1, P_UTDHEPA2)) %>% 
#   group_by(INCQ298A) %>% 
#   #mutate(p=n/sum(n)) %>% 
#   filter(INCQ298A != 77, INCQ298A != 99) %>% 
#   mutate(count = P_UTDHEP+P_UTDROT_S+P_UTDHIB+P_UTDPCV+P_UTDPOL+U24_FLU_24D+P_UTDMMX+P_UTDHEPA1+P_UTDHEPA2) %>% 
#   mutate(p=n/sum(n)) %>% 
#   mutate(Income = fixIncomeLabels(INCQ298A)) %>% 
#   arrange(INCQ298A) %>% 
#   mutate(Income = as_factor(Income))
# 
# #Table for excluding NA's, grouping by income, excluding IDK and Refusals, and assigning income labels
# heppovalt <- na.omit(count(newtable, INCQ298A, P_UTDHEP)) %>% 
#   group_by(INCQ298A) %>% 
#   mutate(p=n/sum(n)) %>% 
#   filter(INCQ298A != 77, INCQ298A != 99, P_UTDHEP == 1) %>% 
#   mutate(Income = fixIncomeLabels(INCQ298A)) %>% 
#   arrange(INCQ298A) %>% 
#   mutate(Income = as_factor(Income))
# 
# 
# 
# 
# library(tidyverse)
# table2018 <- as_tibble(NISPUF18)
# 
# #Arranging levels and labels, some code from Dr. Merkord
# INCQ298Alabels_tbl <- tibble(INCQ298A = INCQ298Alevels, INCQ298Alabels = INCQ298Alabels)
# INCQ298Alabels_tbl
# upCount <- count(NISPUF18, INCQ298A) %>%
#   mutate(INCQ298A = as.double(INCQ298A)) %>%
#   inner_join(INCQ298Alabels_tbl, by = "INCQ298A")
# upCount
# 
# #Code to extract variables from the dataset that will be used for analysis
# newtable <- select(table2018, INCPORAR, INCPORAR_I, INCPOV1, INCQ298A, P_UTDHEP, P_UTDROT_S, P_UTDHIB, P_UTDPCV, P_UTDPOL, U24_FLU_24D, P_UTDMMX, P_UTDHEPA1, P_UTDHEPA2)
# 
# #Code for labeling tables
# #labs(caption="Source: CDC, NCIRD (2020), 2018 National Immunization Survey - Child.")
# 
# #Table for counting utd hep vaccines per income group
# heppov <- na.omit(count(newtable, INCQ298A, P_UTDHEP)) %>% 
#   group_by(INCQ298A) %>% 
#   mutate(p=n/sum(n)) %>% 
#   filter(INCQ298A != 77, INCQ298A != 99, P_UTDHEP == 1)
# 
# heppov2 <- na.omit(count(newtable, INCQ298A, P_UTDHEP)) %>% 
#   group_by(INCQ298A) %>% 
#   mutate(p=n/sum(n)) %>% 
#   filter(INCQ298A != 77, INCQ298A != 99, P_UTDHEP == 1) %>% 
#   inner_join(INCQ298Alabels_tbl, by = "INCQ298A")
# 
# #Function to assign appropriate income labels
# fixIncomeLabels <- function(x) {
#   if (x == 10) {"$35001 - $40000"}
#   else if (x == 11) {"$40001 - $50000"}
#   else if (x == 12) {"$50001 - $60000"}
#   else if (x == 13) {"$60001 - $75000"}
#   else if (x == 14) {"$75001+"}
#   else if (x == 3) {"$0 - $7500"}
#   else if (x == 4) {"$7501 - $10000"}
#   else if (x == 5) {"$10001 - $17500"}
#   else if (x == 6) {"$17501 - $20000"}
#   else if (x == 7) {"$20001 - $25000"}
#   else if (x == 77) {"DON'T KNOW"}
#   else if (x == 8) {"$25001 - $30000"}
#   else if (x == 9) {"$30001 - $35000"}
#   else if (x == 99) {"REFUSED"}
# }
# 
# heppovalt <- na.omit(count(newtable, INCQ298A, P_UTDHEP)) %>% 
#   group_by(INCQ298A) %>% 
#   mutate(p=n/sum(n)) %>% 
#   filter(INCQ298A != 77, INCQ298A != 99, P_UTDHEP == 1) %>% 
#   mutate(Income = fixIncomeLabels(INCQ298A))
# 
# #Plot of income groups and utd hep proportion
# ggplot(data = heppovalt) + 
#   geom_bar(mapping = aes(x = Income, y = p), stat = 'identity') +
#   labs(x = "Income Group", y = "Proportion") +
#   scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1), expand = expansion(mult = 0)) +
#   theme_classic(base_size = 12) +
#   theme(
#     axis.title = element_text(face = "bold"), 
#     axis.text = element_text(color = "black", size = rel(0.9)),
#     axis.text.x = element_text(angle = 45, hjust = 1), 
#     axis.ticks.x = element_blank()
#   )
# 
# #Table for counting utd hep vaccines per poverty group
# heppov3 <- na.omit(count(newtable, INCPOV1, P_UTDHEP)) %>% 
#   group_by(INCPOV1) %>% 
#   mutate(p=n/sum(n)) %>% 
#   filter(P_UTDHEP == 1, INCPOV1 != 4)
# 
# #Plot of poverty groups and utd hep proportion
# ggplot(data = heppov3) + 
#   geom_bar(mapping = aes(x = INCPOV1, y = p), stat = 'identity') +
#   labs(x = "Income Group", y = "Proportion") +
#   scale_y_continuous(breaks = seq(0, 1, 0.1), limits = c(0, 1), expand = expansion(mult = 0)) +
#   theme_classic(base_size = 12) +
#   theme(
#     axis.title = element_text(face = "bold"), 
#     axis.text = element_text(color = "black", size = rel(0.9)),
#     axis.text.x = element_text(angle = 45, hjust = 1), 
#     axis.ticks.x = element_blank()
#   )
