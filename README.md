
<img src="https://www2.mnstate.edu/uploadedImages/Content/Marketing/logos/MSUM_Signature_Vert_Color.jpg" alt="MSUM logo" width="200" style="float:right">

# Variation in the relationship between socioeconomic status and vaccinations in children over time

Kelsey Leach(1, 2)

Instructor: Christopher Merkord(1)

Biosciences Department (1), Chemistry and Biochemistry Department (2)

Minnesota State University Moorhead, 1104 7th Avenue South, Moorhead, MN
56563 USA

## Abstract

The course of vaccinations recommended by the Center for Disease Control
for children is rigorous with numerous vaccination series starting in
the first months of life to protect from potentially life-threatening
infections. Efforts such as the Childhood Immunization Initiative have
pushed to make recommended immunizations more affordable and accessible
for families with children. I used data from the Center for Disease
Control’s National Immunization Surveys in order to analyze the
relationship between time, socioeconomic status, and vaccination rate.
Exploratory data analysis was performed to understand the relationship
between socioeconomic status and children who received the recommended
course of vaccinations and how this relationship evolves over time.

## Introduction

Socioeconomic status has historically played a key role in vaccination
status (Marks et al. 1979). There is a distinct lack of information
surrounding vaccinations and socioeconomic in recent years, and how this
relationship has evolved over time. This research addresses the
question: how has the relationship between socioeconomic status and
vaccinations in children changed in recent years? This will have
implications in understanding potential factors that lead to
unvaccinated children and whether this is related to
accessibility/affordability or personal choice (Galarce et al. 2011).
These results are also useful to dictate possible target populations for
future vaccination initiatives.

## Methods

### Data Acquisition

This project used R Version 4.0.3 and R Studio Version 1.3.1093 (R Core
Team, 2020; R Studio Team, 2020). Data was obtained from the Center for
Disease Control. Data for the 2007-2019 National Immunization Survey
Child Data was downloaded, including the Dataset, R Input Statements,
and Data User’s Guide (DHHS, 2020). The Dataset file includes the full
data from each participant in the survey. The R Input Statements file
includes code to appropriately label the data in the Dataset file
(Harrell, 2020). The Data User’s Guide provides an explanation how the
data was obtained and the meaning of each variable in the dataset.

### Data Preparation

Data was extracted using the filter function to select variables
involving socioeconomic status and vaccination status (Wickham, 2019).
Variables included were up-to-date status on the hepatitis B,
haemophilus influenzae, pneumococcal conjugate, polio, MMR, and
varicella vaccines, as well as poverty status and income group.
Additional filtration was performed on the selected variables to
eliminate entries with insufficient interviewer or provider data, NAs,
and refusals to answer.

## Results

Results are based on the proportion of children (age: 19-35 months) who
are up-to-date on all of the aforementioned vaccines.

There appears to be an increase in the proportion of vaccinated children
as the income of their parent or guardian increases (Figure 1). The
difference, however is not statistically significant (p = 0.4433).

![](README_files/figure-gfm/Income%20Group%20Average-1.png)<!-- -->

Figure 1. The average proportion of vaccinated individuals with respect
to income group.

The proportion of vaccinated children living below poverty is lower than
that of children living above poverty and children living well above
poverty (\>$75K) are vaccinated in even higher proportions (Figure 2).
There is a statistically significant difference in the proportion of
vaccinated children between the three poverty statuses (p = 0.0001602).

![](README_files/figure-gfm/Poverty%20Status%20Average-1.png)<!-- -->

Figure 2. The average proportion of vaccinated children with respect to
poverty status.

There is a positive trend showing an increase in the proportion of
vaccinated children across the poverty status groups (Figure 3). There
is not, however, a statistically significant difference between the
proportion of vaccinated children between the years (p = 0.09154).
Additionally, there is not a statistically significant difference in the
difference between the poverty status groups over time (p = 0.4457).

![](README_files/figure-gfm/Grouped%20bar%20graph-1.png)<!-- -->

Figure 3. The proportion of individuals grouped by poverty status who
are up-to-date on all 6 of the analyzed vaccines with respect to year.

## Discussion

There was an positive trend in the overall proportion of vaccinated
children in the studied time period. This overall increase suggests the
success of educationally-focused aspect of vaccination efforts. Despite
the increase, the discrepancies based on income persist. These lingering
differences emphasize that socioeconomic status is still a critical
influence on vaccination rate. This is also indicative of the necessity
of continued improvement of the accessibility and affordability of
vaccines for those at and below the poverty level.

## References

Frank E Harrell Jr, with contributions from Charles Dupont and many
others. (2020). Hmisc: Harrell Miscellaneous. R package version 4.4-2.
<https://CRAN.R-project.org/package=Hmisc>

Galarce, E.M., Minsky, S., Viswanath, K. (2011) Socioeconomic status,
demographics, beliefs and A(H1N1) vaccine uptake in the United States.
Vaccine.

Marks, J.S., Halpin, T.J., Irvin, J.J., Johnson, D.A., and Keller J.R.
(1979) Risk Factors Associated with Failure to Receive Vaccinations.
Pediatrics.

R Core Team (2020). R: A language and environment for statistical
computing. R Foundation for Statistical Computing, Vienna, Austria. URL
<https://www.R-project.org/>.

RStudio Team (2020). RStudio: Integrated Development Environment for R.
RStudio, PBC, Boston, MA URL <http://www.rstudio.com/>.

U.S. Department of Health and Human Services (DHHS). National Center for
Immunization and Respiratory Diseases . The 2007-2019 National
Immunization Survey-Child, Atlanta, GA : Centers for Disease Control and
Prevention, 2020.

Wickham et al., (2019). Welcome to the tidyverse. Journal of Open Source
Software, 4(43), 1686, <https://doi.org/10.21105/joss.01686>
