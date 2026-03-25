version 18

capture log close _base
log using "${LOGS}/03_baseline_regs.log", replace text name(_base)

use "${cleanpanel}", clear
xtset ${idvar} ${timevar}

estimates clear

* Model 1: controls only.
quietly regress ${depvar} ${controls} i.${timevar}, vce(cluster ${clustvar})
estimates store m1

* Model 2: add the main explanatory variable.
quietly regress ${depvar} ${mainvar} ${controls} i.${timevar}, vce(cluster ${clustvar})
estimates store m2

* Model 3: preferred panel FE specification.
quietly xtreg ${depvar} ${mainvar} ${controls} i.${timevar}, fe vce(cluster ${clustvar})
estimates store m3

* Multicollinearity check after the pooled model.
regress ${depvar} ${mainvar} ${controls} i.${timevar}, vce(cluster ${clustvar})
estat vif

etable, estimates(m1 m2 m3) ///
    title("Table 3. Baseline Regression Results") ///
    showstars showstarsnote ///
    cstat(_r_b, nformat(%9.3f)) ///
    cstat(_r_se, nformat(%9.3f)) ///
    mstat(N) mstat(r2) ///
    keep(${mainvar} ${controls}) ///
    export("${DOCS}/Table_3_Baseline_Regression_Results.docx", replace)

log close _base
