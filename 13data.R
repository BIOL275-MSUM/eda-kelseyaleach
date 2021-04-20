library(tidyverse)
alltable13 <- as_tibble(NISPUF13)

#Code to extract variables from the dataset that will be used for analysis
newtable13 <- select(alltable13, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable13 <- na.omit(count(newtable13, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6) %>% 
  mutate(year = "2013") %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  mutate(Income = INCPOV1) %>% 
  select(Income, n, p, povLab, year)
