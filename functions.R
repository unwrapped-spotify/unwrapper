library(dplyr)

streaming_data_min <- function() {
    streaming_data_cleaned$end_time %>% min() %>% as.Date
}

streaming_data_max <- function() {
    streaming_data_cleaned$end_time %>% max() %>% as.Date
}