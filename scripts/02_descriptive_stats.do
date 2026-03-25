version 18

capture log close _desc
log using "${LOGS}/02_descriptive_stats.log", replace text name(_desc)

use "${cleanpanel}", clear

local descvars ${depvar} ${mainvar} ${controls}

* Table 1: descriptive statistics.
tabstat `descvars', statistics(n mean sd p50 min max) columns(statistics) save
matrix T1 = r(StatTotal)'
matrix colnames T1 = N Mean SD P50 Min Max

putdocx begin
putdocx paragraph, style(Heading1)
putdocx text ("Table 1. Descriptive Statistics")
putdocx paragraph
putdocx text ("Sample: analysis sample used in the baseline regressions.")
putdocx table tab1 = matrix(T1), rownames colnames layout(autofitcontents)
putdocx save "${DOCS}/Table_1_Descriptive_Statistics.docx", replace

* Table 2: pairwise correlations.
pwcorr `descvars', sig star(0.1)
matrix C = r(rho)

putdocx begin
putdocx paragraph, style(Heading1)
putdocx text ("Table 2. Pairwise Correlations")
putdocx paragraph
putdocx text ("Pearson correlations. Significance output is recorded in the Stata log.")
putdocx table tab2 = matrix(C), rownames colnames layout(autofitcontents) nformat(%9.3f)
putdocx save "${DOCS}/Table_2_Pairwise_Correlations.docx", replace

log close _desc
