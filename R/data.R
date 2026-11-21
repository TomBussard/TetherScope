read_weekly_market <- function(path = "tether_market_dominance.xlsx") {
  raw <- readxl::read_excel(path)
  raw$date <- as.Date(raw$timeClose)
  sample <- subset(raw, date >= as.Date("2020-01-01") & date < as.Date("2024-01-01"))
  sample <- sample[order(sample$date), ]
  stopifnot(nrow(sample) > 20, all(diff(as.integer(sample$date)) == 7),
            all(is.finite(sample$crypto_volatility_index)), all(sample$crypto_volatility_index > 0),
            all(is.finite(sample$global_market_dominance)), all(sample$global_market_dominance > 0))

  # The workbook stores market share as a fraction. A value of 0.03 means three percent.
  sample$share_pct <- 100 * sample$global_market_dominance
  sample
}
