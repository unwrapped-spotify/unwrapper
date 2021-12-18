# This script produces a random sample of my spotify data - didn't fancy uploading all of it

# Load libraries
library(dplyr)            # Data frame operations
library(jsonlite)         # JSON operations
library(janitor)          # Cleaning operations

# Load streaming data - stored in the data folder
# List the files
streaming_data <- list.files("data", full.names = TRUE) %>%
  # Use lapply to read each json folder then convert to tibble
  lapply(function(filename) {fromJSON(txt = filename) %>% as_tibble}) %>%
  # Creates a list fo tibbles so collapse
  bind_rows %>%
  # Get col names into snake_case
  clean_names

# Create the connection to the file for output - specify encoding due to special characters
output_file = file(encoding = "UTF-8", "data.json")


streaming_data %>%
  # Take random sample
  sample_n(3000) %>%
  # Convert to json strong
  toJSON %>%
  # Write
  writeLines(con = output_file)
