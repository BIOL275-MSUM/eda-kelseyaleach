library(tidyverse)
alltable07 <- as_tibble(NISPUF07)

#Code to extract variables from the dataset that will be used for analysis
newtable07 <- select(alltable07, INCPORAR, INCPOV1, INCQ298A, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)

#Function to assign appropriate poverty labels
fixPovertyLabels <- function(x) {
  if (x == 1) {"ABOVE POVERTY, > $75K"}
  else if (x == 2) {"ABOVE POVERTY, <= $75K"}
  else if (x == 3) {"BELOW POVERTY"}
}

#Table for counting utd vaccines per poverty group
povtable07 <- na.omit(count(newtable07, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(count = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(P_UTDHEP == 1, INCPOV1 != 4, count == 6) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2007") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year)

