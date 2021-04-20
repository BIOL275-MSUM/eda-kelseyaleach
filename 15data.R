library(tidyverse)
alltable15 <- as_tibble(NISPUF15)

#Code to extract variables from the dataset that will be used for analysis
newtable15 <- select(alltable15, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Function to assign appropriate poverty labels
fixPovertyLabels <- function(x) {
  if (x == 1) {"Above Poverty >$75K"}
  else if (x == 2) {"Above Poverty <=$75K"}
  else if (x == 3) {"Below Poverty"}
}

#Table for counting utd vaccines per poverty group
povtable15 <- na.omit(count(newtable15, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != "UNKNOWN", count == 6) %>% 
  mutate(year = "2015") %>% 
  mutate(povLab = as_factor(INCPOV1)) %>% 
  mutate(Income = INCPOV1) %>% 
  select(Income, n, p, povLab, year)
