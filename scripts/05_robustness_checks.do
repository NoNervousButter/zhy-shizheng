version 18

capture log close _rob
log using "${LOGS}/05_robustness_checks.log", replace text name(_rob)

use "${cleanpanel}", clear
xtset ${idvar} ${timevar}

estimates clear
local rob_models

* Robustness 1: alternative dependent variable.
capture confirm variable ${altdepvar}
if !_rc {
    quietly xtreg ${altdepvar} ${mainvar} ${controls} i.${timevar}, fe vce(cluster ${clustvar})
    estimates store r1
    local rob_models "`rob_models' r1"
}

* Robustness 2: alternative explanatory variable.
capture confirm variable ${altmainvar}
if !_rc {
    quietly xtreg ${depvar} ${altmainvar} ${controls} i.${timevar}, fe vce(cluster ${clustvar})
    estimates store r2
    local rob_models "`rob_models' r2"
}

* Robustness 3: balanced-panel or restricted-sample specification.
if ${run_balance} == 1 {
    bysort ${idvar}: egen _tcount = count(${timevar})
    quietly summarize _tcount
    keep if _tcount == r(max)
    quietly xtreg ${depvar} ${mainvar} ${controls} i.${timevar}, fe vce(cluster ${clustvar})
    estimates store r3
    local rob_models "`rob_models' r3"
}

if "`rob_models'" != "" {
    etable, estimates(`rob_models') ///
        title("Table 5. Robustness Checks") ///
        showstars showstarsnote ///
        cstat(_r_b, nformat(%9.3f)) ///
        cstat(_r_se, nformat(%9.3f)) ///
        mstat(N) ///
        keep(${mainvar} ${altmainvar} ${controls}) ///
        export("${DOCS}/Table_5_Robustness_Checks.docx", replace)
}

log close _rob
