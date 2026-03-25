# Word Table Standards

Use this file when exporting empirical results from Stata to Word for a paper, memo, thesis chapter, or referee response.

## Core table set

The default Word package should contain:

- `Table 1. Descriptive Statistics`
- `Table 2. Pairwise Correlations`
- `Table 3. Baseline Regression Results`
- `Table 4. Endogeneity Checks`
- `Table 5. Robustness Checks`

## Formatting rules

- Use concise academic titles, not conversational titles.
- Keep one decimal convention per table. Three decimals is the default for coefficients and summary statistics.
- Put standard errors in parentheses on the line below the coefficient.
- Right-align numeric columns.
- Use variable labels that match the paper body.
- Include a notes section under every regression table.

## Regression-table notes should usually report

- dependent variable
- sample period
- unit of observation
- whether controls are included
- which fixed effects are included
- clustering level
- significance convention

Example note content:

`Notes: The dependent variable is Return on Assets. Standard errors clustered at the firm level are in parentheses. All specifications include firm and year fixed effects. Controls include firm size, leverage, and sales growth. * p<0.10, ** p<0.05, *** p<0.01.`

## Correlation-table note

- state whether Pearson or Spearman correlations are reported
- if significance stars are unavailable in the exported matrix, note that significance appears in the Stata log or appendix output

## Word memo structure

The memo should be short and paper-like:

1. Data and sample
2. Variable construction
3. Baseline model
4. Endogeneity strategy
5. Robustness summary
6. Interpretation limits

## Result-writing rules

- Start with the preferred specification, not the weakest one.
- Report the sign, significance, and magnitude of the main coefficient.
- When possible, translate the coefficient into a meaningful unit change.
- Mention whether the result survives endogeneity and robustness checks.
- Use cautious language unless the design clearly supports causal interpretation.
