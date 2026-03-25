version 18

capture log close _endo
log using "${LOGS}/04_endogeneity_checks.log", replace text name(_endo)

use "${cleanpanel}", clear
xtset ${idvar} ${timevar}

estimates clear
local endo_models

* Endogeneity route A: stronger timing structure with a lagged regressor.
gen L1_${mainvar} = L.${mainvar}
quietly xtreg ${depvar} L1_${mainvar} ${controls} i.${timevar}, fe vce(cluster ${clustvar})
estimates store e1
local endo_models "`endo_models' e1"

* Endogeneity route B: placebo using a lead of the explanatory variable.
if ${run_placebo} == 1 {
    gen F1_${mainvar} = F.${mainvar}
    quietly xtreg ${depvar} F1_${mainvar} ${controls} i.${timevar}, fe vce(cluster ${clustvar})
    estimates store e2
    local endo_models "`endo_models' e2"
}

* Endogeneity route C: IV only if a defensible instrument exists.
capture confirm variable ${ivvar}
if ${run_iv} == 1 & !_rc {
    quietly ivregress 2sls ${depvar} ${controls} i.${timevar} ///
        (${mainvar} = ${ivvar}), vce(cluster ${clustvar})
    estimates store e3
    estat firststage
    local endo_models "`endo_models' e3"
}

if "`endo_models'" != "" {
    etable, estimates(`endo_models') ///
        title("Table 4. Endogeneity Checks") ///
        showstars showstarsnote ///
        cstat(_r_b, nformat(%9.3f)) ///
        cstat(_r_se, nformat(%9.3f)) ///
        mstat(N) ///
        keep(L1_${mainvar} F1_${mainvar} ${mainvar} ${controls}) ///
        export("${DOCS}/Table_4_Endogeneity_Checks.docx", replace)
}

log close _endo
