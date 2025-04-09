source("databricks_sql_client.R")

qs <- get_instance()
cat("Fetching table tags...\n")
tags_df <- qs$get_functional_spending_by_country_year()

# Print a preview of the result
cat("Preview of table tags:\n")
print(head(tags_df))

# Optional: inspect column names
cat("Column names:\n")
print(colnames(tags_df))

