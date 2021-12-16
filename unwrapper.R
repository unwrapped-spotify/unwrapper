# Load libraries
library(dplyr)            # Data frame operations
library(jsonlite)         # JSON operations
library(janitor)          # Cleaning operations

# Load streaming data

list.files("data", full.names = TRUE) %>%
  lapply(function(filename) {fromJSON(txt = filename) %>% as_tibble}) %>%
  bind_rows %>%
  clean_names
