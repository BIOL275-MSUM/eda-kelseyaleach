library(tidyverse)
alltable14 <- as_tibble(NISPUF14)

#Code to extract variables from the dataset that will be used for analysis
newtable14 <- select(alltable14, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Table for counting utd vaccines per poverty group
povtable14 <- na.omit(count(newtable14, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6) %>% 
  mutate(year = "2014") %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  mutate(Income = INCPOV1) %>% 
  select(Income, n, p, povLab, year)
