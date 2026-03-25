version 18

capture log close _build
log using "${LOGS}/01_build_sample.log", replace text name(_build)

use "${rawdata}", clear

* Confirm the variables required for the pipeline exist.
foreach v in ${depvar} ${mainvar} ${controls} ${idvar} ${timevar} ${clustvar} {
    capture confirm variable `v'
    if _rc {
        di as error "Missing required variable: `v'"
        exit 111
    }
}

* Drop duplicate panel-time observations if they are true duplicates.
duplicates tag ${idvar} ${timevar}, gen(_dup_panel)
count if _dup_panel > 0
duplicates report ${idvar} ${timevar}

* Keep a documented analysis sample.
gen byte ${sampleflag} = 1
replace ${sampleflag} = 0 if missing(${depvar}, ${mainvar})
foreach v in ${controls} {
    replace ${sampleflag} = 0 if missing(`v')
}
keep if ${sampleflag} == 1

* Typical transformations. Adapt as needed.
capture drop ln_${depvar}
capture drop ln_${mainvar}
gen ln_${depvar}  = ln(${depvar})  if ${depvar}  > 0
gen ln_${mainvar} = ln(${mainvar}) if ${mainvar} > 0

* Example winsorization at the 1st and 99th percentiles using built-in commands.
* Replace the variable list to match the paper.
foreach v in ${depvar} ${mainvar} ${controls} {
    quietly summarize `v', detail
    local p1  = r(p1)
    local p99 = r(p99)
    replace `v' = `p1'  if `v' < `p1'  & !missing(`v')
    replace `v' = `p99' if `v' > `p99' & !missing(`v')
}

* Panel declaration if applicable.
xtset ${idvar} ${timevar}

compress
save "${cleanpanel}", replace

log close _build
