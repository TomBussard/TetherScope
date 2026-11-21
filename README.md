# TetherScope

When crypto volatility changes, does Tether's share of the market move next? We used weekly observations to examine the timing in both directions.

## Method and result

We matched 115 consecutive weekly observations from October 2021 to December 2023 and fitted a three-lag vector autoregression. Past changes in log volatility helped predict changes in the growth rate of Tether's market share (Granger p = 0.0157). Testing the reverse direction gave p = 0.5001. These results describe predictive timing within this sample.

The [three-page English report](TetherScope.pdf) shows the weekly series, stationarity tests, forecast and impulse response. The [English R notebook](CryptoEconometrics.Rmd) runs directly on the [input workbook](tether_market_dominance.xlsx). Our [original French report](CryptoEconometrics.pdf) and its [coursework notebook](Coursework-2024.Rmd) include the longer analysis of local projections and cointegration.

## Reproduce the report

From the repository directory, use R with Pandoc and XeLaTeX installed.

```r
install.packages(c("rmarkdown", "readxl", "urca", "vars", "forecast"))
rmarkdown::render("CryptoEconometrics.Rmd", output_file = "TetherScope.pdf")
```

Developed by **Tom Bussard and Charles Odend'hal** at Université Paris Dauphine PSL.
