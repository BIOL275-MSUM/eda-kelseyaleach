povtable07b1 <- na.omit(count(newtable07, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(ct = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCPOV1 != 4, INCPOV1 ==1) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2007") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year, ct) %>% 
  mutate(povLab = as_factor(povLab))

povtable07b2 <- na.omit(count(newtable07, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(ct = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCPOV1 != 4, INCPOV1 ==2) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2007") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year, ct) %>% 
  mutate(povLab = as_factor(povLab))

povtable07b3 <- na.omit(count(newtable07, INCPOV1, P_UTDHEP, P_UTDHIB, P_UTDPCV, P_UTDPOL, P_UTDMMX, P_U12VRC)) %>% 
  group_by(INCPOV1) %>% 
  mutate(p=n/sum(n)) %>% 
  mutate(ct = P_UTDHEP+P_UTDHIB+P_UTDPCV+P_UTDPOL+P_UTDMMX+P_U12VRC) %>% 
  filter(INCPOV1 != 4, INCPOV1 ==3) %>% 
  mutate(povLab = fixPovertyLabels(INCPOV1)) %>% 
  mutate(year = "2007") %>% 
  mutate(povLab = as_factor(povLab)) %>% 
  mutate(Income = povLab) %>% 
  select(Income, n, p, povLab, year, ct) %>% 
  mutate(povLab = as_factor(povLab))

sum(povtable07b$n)
sum(povtable07b1$n)
sum(povtable07b2$n)
sum(povtable07b3$n)
chisq.test(x=c(4063, 5105, 2170), y=c(3777, 5221, 2338))


# Difference between poverty status groups ---------------------------------------

resKrusPov <- kruskal.test(p ~ INCPOV1, data = yrtable12)
resKrusPov


# Difference between years ------------------------------------------------

resKrusYr <- kruskal.test(p ~ year, data = yrtable12)
resKrusYr


