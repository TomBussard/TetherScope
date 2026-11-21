# TetherScope

When crypto volatility changes, does Tether's share of the market move next? We used weekly observations to examine the timing in both directions.

## Method and result

We transformed the two series, checked their time-series properties and fitted a vector autoregression. In the reported sample, lagged changes in volatility helped predict changes in Tether dominance. The reverse test did not reach the 5 percent significance level. These tests measure predictive timing within the fitted model.

The [finished report](CryptoEconometrics.pdf) is the quickest way to see the figures and results. The [R Markdown notebook](CryptoEconometrics.Rmd) contains the tests and model code, and the [input workbook](tether_market_dominance.xlsx) is included.

## Reproduce the report

Open the notebook in RStudio, install the packages loaded in its setup section and knit it to PDF with a LaTeX installation. Keep the notebook, workbook and project image in the same directory.

Developed by **Tom Bussard and Charles Odend'hal** at Université Paris Dauphine PSL.
