# Endogeneity And Robustness Menu

Use this file to choose a defensible identification-check package instead of running generic tests by habit.

## Step 1: Identify the main threat

Pick the dominant concern first:

- omitted variables
- reverse causality
- simultaneity
- sample selection
- measurement error

If you cannot name the threat, do not claim the check solves endogeneity.

## Endogeneity menu

### A. Panel fixed-effects route

Use when unobserved unit-specific heterogeneity is likely to bias pooled results.

Standard package:

- unit fixed effects
- time fixed effects
- cluster at the unit or treatment-assignment level
- if meaningful, use lagged key regressors as a timing refinement rather than a full solution

### B. Instrumental-variables route

Use only when the instrument has a defensible relevance and exclusion argument.

Minimum reporting standard:

- first-stage coefficient and significance
- weak-instrument diagnostic
- overidentification test when multiple instruments exist
- plain-language defense of exclusion

Do not use IV only because the baseline result is potentially endogenous.

### C. Placebo or lead falsification route

Use when timing is central and the theory implies no effect before treatment or exposure.

Examples:

- future explanatory variable should not predict current outcome
- placebo treatment assigned before the real event should be null

### D. Selection route

Use when treated and untreated observations differ systematically.

Possible tools:

- propensity-score matching
- inverse-probability weighting
- entropy balancing
- Heckman-style sample-selection correction

Use these only when the assumptions are plausible and observable covariates are rich enough.

## Robustness menu

Choose two or three checks that directly pressure-test the main claim.

### 1. Alternative variable definitions

- replace the dependent variable with a closely related measure
- replace the key regressor with an alternative operationalization

### 2. Alternative sample

- drop crisis years or outlier years
- exclude special industries
- use a balanced panel
- trim or winsorize more conservatively

### 3. Alternative inference or specification

- alternative clustering level
- additional fixed effects
- nonlinear term if theory suggests nonlinearity
- interaction only if theory predicts moderation

## Default package for a standard panel paper

If the user does not specify otherwise, a reasonable default sequence is:

1. baseline pooled or panel model
2. stronger fixed-effects model
3. lagged key regressor or placebo timing check
4. alternative dependent variable
5. alternative sample restriction
6. alternative clustering or FE structure

## Reporting rule

When endogeneity or robustness checks weaken the main result, say so explicitly in both the regression note and the prose discussion.
