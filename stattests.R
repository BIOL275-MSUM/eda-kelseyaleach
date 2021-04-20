
# Difference between the pdiff by year ------------------------------------

resKrusDiff <- kruskal.test(c(0.13, 0.11, 0.14, 0.1, 0.11, 0.1, 0.12, 0.1, 0.08, 0.09, 0.08, 0.09, 0.11), c(2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011, 2010, 2009, 2008, 2007))
resKrusDiff

# Difference between poverty status groups ---------------------------------------

resKrusPov <- kruskal.test(p ~ INCPOV1, data = yrtable12)
resKrusPov


# Difference between years ------------------------------------------------

resKrusYr <- kruskal.test(p ~ year, data = yrtable12)
resKrusYr


# Difference between income groups ----------------------------------------

resKrusInc <- kruskal.test(average ~ povLab, data = incsum)
resKrusInc


