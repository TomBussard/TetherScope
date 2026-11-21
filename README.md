# TetherScope

When crypto volatility changes, does Tether's share of the market move next? I used weekly observations to examine the timing in both directions.

## Method and result

I matched 115 consecutive weekly observations from October 2021 to December 2023 and fitted a three-lag vector autoregression. Past changes in log volatility helped predict changes in the growth rate of Tether's market share (Granger p = 0.0157). Testing the reverse direction gave p = 0.5001. These results describe predictive timing within this sample.

![Crypto volatility and Tether market share, October 2021 to December 2023](figures/weekly-series.png)

The [three-page English report](TetherScope.pdf) shows the weekly series, stationarity tests, forecast and impulse response. The [English R notebook](CryptoEconometrics.Rmd) runs directly on the [input workbook](tether_market_dominance.xlsx).

## Follow the model

| Step | Choice in the study | Reason |
| --- | --- | --- |
| Alignment | Sort weekly observations and check seven days between consecutive dates | A missing week changes what one lag means |
| Transformation | First difference of log volatility, second difference of log market share | Study changes in volatility and changes in the growth rate of dominance |
| Forecast | MA(1) on the transformed dominance series, three weeks ahead | Keep the forecast and its interval in the fitted units |
| Directional test | VAR with an intercept and three lags, tested in both directions | Compare whether one series adds predictive information beyond the other's own past |

The workbook records market share as a fraction. I multiply by 100 for the level chart before taking logs. The transformed series are aligned again after differencing. The report compares ADF and KPSS diagnostics, checks forecast residuals at 20 lags and gives a 12-week impulse response with 499 bootstrap runs. That response orders volatility first. Another ordering could change the same-week effect.

The [input function](R/data.R) checks the weekly spacing, positivity and finiteness of both input series. In R, run `source("R/data.R", encoding = "UTF-8")` and `head(read_weekly_market())` to inspect the aligned rows before fitting a model.

## Reproduce the report

From the repository directory, use R with Pandoc and XeLaTeX installed.

```r
install.packages(c("rmarkdown", "readxl", "urca", "vars", "forecast"))
rmarkdown::render("CryptoEconometrics.Rmd", output_file = "TetherScope.pdf")
```

Tom Bussard
