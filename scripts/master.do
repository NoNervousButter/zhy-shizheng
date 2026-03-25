version 18
clear all
set more off
capture log close

* Update these paths before running.
global ROOT "`c(pwd)'"
global DATA    "${ROOT}/data"
global CODE    "${ROOT}/scripts"
global OUTPUT  "${ROOT}/output"
global TABLES  "${OUTPUT}/tables"
global DOCS    "${OUTPUT}/word"
global LOGS    "${OUTPUT}/logs"

cap mkdir "${OUTPUT}"
cap mkdir "${DATA}"
cap mkdir "${DATA}/derived"
cap mkdir "${TABLES}"
cap mkdir "${DOCS}"
cap mkdir "${LOGS}"

log using "${LOGS}/master.log", replace text

* Project-specific macros. Replace these placeholders.
global rawdata      "${DATA}/raw/main_panel.dta"
global cleanpanel   "${DATA}/derived/analysis_panel.dta"
global depvar       "y"
global mainvar      "x_main"
global controls     "size leverage roa growth"
global idvar        "firm_id"
global timevar      "year"
global clustvar     "firm_id"
global industryvar  "industry"
global altdepvar    "y_alt"
global altmainvar   "x_alt"
global ivvar        "z_iv"
global sampleflag   "in_sample"

* Optional toggles.
global run_iv       0
global run_placebo  1
global run_balance  1

do "${CODE}/01_build_sample.do"
do "${CODE}/02_descriptive_stats.do"
do "${CODE}/03_baseline_regs.do"
do "${CODE}/04_endogeneity_checks.do"
do "${CODE}/05_robustness_checks.do"
do "${CODE}/06_word_report.do"

log close
