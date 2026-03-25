---
name: zhy-shizheng
description: Build or review a full empirical-paper workflow in Stata for economics, finance, accounting, management, and related social-science research. Use when the task involves `.dta` data, `.csv` panel data, `.do` files, descriptive statistics, correlation analysis, baseline regressions, moderation analysis, endogeneity checks, robustness tests, and Word-ready academic tables or reports.
---

# ZHY ShiZheng

## Overview

Use this skill to turn an empirical research design into a reproducible Stata workflow and Word-ready paper outputs. Follow it when you need a complete academic pipeline rather than a one-off regression.

## Quick Start

1. Lock the research design before coding: sample window, unit of observation, dependent variable, key explanatory variable, controls, fixed effects, and clustering level.
2. Copy the Stata templates in `scripts/` into the project or adapt them in place.
3. Build the analysis sample first, then produce descriptive statistics and correlations, then estimate the baseline model, then run endogeneity and robustness checks.
4. Export all paper tables to `.docx` and generate a short Word memo that states the sample, specification, inference choice, and headline findings.

## Workflow

### 1. Scope the empirical design

Always make these items explicit before touching the data:

- research question and whether the claim is descriptive or causal
- unit of observation
- sample period and exclusion rules
- dependent variable
- key explanatory variable or treatment
- control variables
- fixed effects
- clustering level
- preferred endogeneity strategy
- two or three robustness checks that are substantively meaningful

If the identification claim is weak, say so and keep the language correlational.

### 2. Audit and construct the sample

Use `scripts/01_build_sample.do`.

Check at minimum:

- duplicate IDs and duplicate panel-time keys
- missingness in the outcome, key regressor, and must-have controls
- impossible values, coding inconsistencies, and unit mismatches
- merge integrity if multiple data sources are used
- transformations such as logs, ratios, and winsorization
- panel declaration with `xtset` when relevant

Document every sample restriction in code and in the Word note.

### 3. Produce descriptive statistics

Use `scripts/02_descriptive_stats.do`.

Paper-standard descriptive statistics should usually report:

- `N`
- mean
- standard deviation
- median when skew is material
- minimum and maximum

If the paper centers on treated vs control firms, policy vs non-policy periods, East vs West, SOE vs non-SOE, or similar splits, also add subgroup means and difference tests.

Read [paper-workflow-standards.md](./references/paper-workflow-standards.md) for the reporting rules.

### 4. Produce the correlation table

Use `scripts/02_descriptive_stats.do` for pairwise correlations after the descriptive table.

Standard practice:

- report pairwise correlations for the outcome, main explanatory variable, and main controls
- inspect sign patterns before regression
- do not treat correlation as evidence of causal identification
- if many regressors are conceptually close, also inspect multicollinearity with `vif` after the baseline model

### 5. Estimate the baseline regression

Use `scripts/03_baseline_regs.do`.

Build the regression table progressively:

1. controls only
2. add the main explanatory variable
3. add fixed effects, interactions, or mechanism terms only when the design requires them

Always state:

- dependent variable
- sample
- fixed effects
- standard-error type
- clustering level

Prefer official Stata commands and factor-variable notation. For panels, use `xtreg, fe` or another design-consistent estimator.

### 6. Run endogeneity checks

Use `scripts/04_endogeneity_checks.do`.

Do not treat "lagged independent variables" as a complete endogeneity solution. Choose the strategy that matches the design:

- panel omitted-variable concern: add firm fixed effects and stronger time controls
- reverse causality concern: lag the key regressor, run lead/placebo falsification where defensible
- valid instrument available: use `ivregress 2sls` and report first-stage strength
- selection concern: use matching, sample balancing, or explicit selection modeling only when justified

Read [endogeneity-and-robustness-menu.md](./references/endogeneity-and-robustness-menu.md) before finalizing claims.

### 7. Run two or three robustness checks

Use `scripts/05_robustness_checks.do`.

Default robustness menu:

- alternative dependent-variable definition
- alternative key explanatory-variable definition
- alternative sample restriction or trimming rule
- alternative fixed-effects or clustering structure

Pick checks that challenge the identification rather than mechanically inflating the appendix.

### 8. Export Word-ready tables and memo

Use `scripts/06_word_report.do`.

The standard output set is:

- `Table 1` descriptive statistics
- `Table 2` correlation matrix
- `Table 3` baseline regressions
- `Table 4` endogeneity checks
- `Table 5` robustness checks
- one short Word memo that explains the sample, model, and headline findings in prose

Read [word-table-standards.md](./references/word-table-standards.md) before polishing final tables.

## Reporting Standards

- Keep variable labels academically readable and consistent with the paper draft.
- Use the same decimal precision within a table.
- Put standard errors in parentheses under coefficients.
- Add stars and a note explaining the star convention.
- State whether controls, year fixed effects, industry fixed effects, and firm fixed effects are included.
- State the clustering level in every regression note.
- Separate statistical significance from substantive magnitude in the memo text.

## Resources

### Scripts

- `scripts/master.do`: top-level pipeline with folder macros and execution order
- `scripts/01_build_sample.do`: sample construction and cleaning template
- `scripts/02_descriptive_stats.do`: descriptive table and correlation matrix
- `scripts/03_baseline_regs.do`: baseline regressions and main table export
- `scripts/04_endogeneity_checks.do`: endogeneity menu with IV and placebo placeholders
- `scripts/05_robustness_checks.do`: three standard robustness routes
- `scripts/06_word_report.do`: Word memo and final table exports

### References

- `references/paper-workflow-standards.md`: mainstream structure and table logic for empirical papers
- `references/endogeneity-and-robustness-menu.md`: decision rules for identification checks and robustness design
- `references/word-table-standards.md`: formatting standards for academic Word tables and result narration

## Boundaries

- This skill standardizes workflow quality, but it does not turn a weak design into a credible causal paper.
- If Stata is unavailable in the environment, write and organize the `.do` files anyway and say clearly that execution was not performed.
- If the user already has team or journal table standards, preserve them and adapt this skill instead of overwriting them.
