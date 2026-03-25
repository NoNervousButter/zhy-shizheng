version 18

capture log close _word
log using "${LOGS}/06_word_report.log", replace text name(_word)

use "${cleanpanel}", clear

quietly summarize ${depvar}
local ymean : display %9.3f r(mean)
quietly summarize ${mainvar}
local xmean : display %9.3f r(mean)

putdocx begin
putdocx paragraph, style(Title)
putdocx text ("Empirical Results Memo")

putdocx paragraph, style(Heading1)
putdocx text ("1. Data and Sample")
putdocx paragraph
putdocx text ("State the data source, sample window, unit of observation, exclusions, and final sample size here.")

putdocx paragraph, style(Heading1)
putdocx text ("2. Variable Construction")
putdocx paragraph
putdocx text ("Dependent variable: ${depvar}. Mean = `ymean'. Key explanatory variable: ${mainvar}. Mean = `xmean'. Add exact definitions and transformations here.")

putdocx paragraph, style(Heading1)
putdocx text ("3. Baseline Model")
putdocx paragraph
putdocx text ("Report the preferred specification, including controls, fixed effects, and clustering choice. Summarize the sign, significance, and magnitude of the main coefficient.")

putdocx paragraph, style(Heading1)
putdocx text ("4. Endogeneity Strategy")
putdocx paragraph
putdocx text ("Explain which endogeneity threat is most important and why the selected checks address it.")

putdocx paragraph, style(Heading1)
putdocx text ("5. Robustness Summary")
putdocx paragraph
putdocx text ("State whether the main result survives alternative variable definitions, sample restrictions, and inference choices.")

putdocx paragraph, style(Heading1)
putdocx text ("6. Table Inventory")
putdocx paragraph
putdocx text ("Generated Word tables:")
putdocx paragraph
putdocx text ("Table_1_Descriptive_Statistics.docx")
putdocx paragraph
putdocx text ("Table_2_Pairwise_Correlations.docx")
putdocx paragraph
putdocx text ("Table_3_Baseline_Regression_Results.docx")
putdocx paragraph
putdocx text ("Table_4_Endogeneity_Checks.docx")
putdocx paragraph
putdocx text ("Table_5_Robustness_Checks.docx")

putdocx save "${DOCS}/Empirical_Results_Memo.docx", replace

log close _word
