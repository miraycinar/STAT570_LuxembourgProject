library(dplyr)
library(purrr)
library(readxl)
library(stringr)
library(janitor)
raw_data <- tempfile(fileext = ".xlsx")

url <- "https://is.gd/1vvBAc"

download.file(url,raw_data, method = "auto", mode = "wb")

?download.file

sheets <- excel_sheets(raw_data) ; sheets

raw_data <- map(
  sheets,
  ~read_clean(raw_data, skip=10, sheet=.) 

  ) |>
  bind_rows() |>
  clean_names()
