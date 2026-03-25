# Paper Workflow Standards

Use this file when you need the default academic structure for an empirical paper.

## Canonical empirical sequence

1. Data and sample construction
2. Variable definitions
3. Descriptive statistics
4. Correlation analysis
5. Baseline regression
6. Endogeneity analysis
7. Robustness tests
8. Additional analyses if needed: heterogeneity, mechanisms, placebo, event study, appendix
9. Word-ready tables and brief result interpretation

## Sample-construction standards

- State the raw data source and sample period.
- State exclusions in the order they are applied.
- Keep one authoritative analysis dataset for the final regressions.
- Define the unit of observation explicitly.
- For panel data, verify the panel identifier and time variable before `xtset`.
- Use transformations only when justified and document them in code and notes.

## Descriptive-statistics standards

The default descriptive table should include:

- `N`
- mean
- standard deviation
- median for skewed variables
- minimum
- maximum

Add subgroup means and difference tests when the paper's theory centers on group comparisons.

## Correlation-analysis standards

- Include the dependent variable, key explanatory variable, and main controls.
- Use the correlation table to inspect preliminary sign patterns and redundancy, not to make causal claims.
- Follow with a multicollinearity check when the model contains conceptually overlapping regressors.

## Baseline-regression standards

Build the main table in a sequence that is easy to read:

1. minimal model
2. add controls
3. add fixed effects or full preferred specification

Every regression table must identify:

- dependent variable
- core regressor
- controls
- fixed effects
- sample size
- standard-error type
- clustering level
- adjusted or within `R-squared` when appropriate

## Endogeneity standards

Do not present an endogeneity check as a ritual add-on. Match it to the threat:

- omitted variables: richer FE, more defensible controls, alternative timing structure
- reverse causality: lagging, lead falsification, or an external source of variation
- simultaneity: IV or a design-based shock
- selection: balancing, matching, reweighting, or sample-selection modeling when justified

The write-up should explain why the test addresses a real threat in the design.

## Robustness standards

Good robustness checks change one margin at a time:

- outcome definition
- key explanatory-variable definition
- sample restriction
- inference choice
- fixed-effects structure

Avoid weak robustness sections that only recycle the same specification with cosmetic changes.

## Writing standards for the results section

- Report sign, significance, and magnitude.
- Interpret coefficients in economically meaningful units where possible.
- Do not equate `p < 0.05` with substantive importance.
- If the result weakens across specifications, say so directly.
- Distinguish core results from supportive appendix results.
