library(DBI)
library(arrow)
library(dplyr)

# Environment variables
SERVER_HOSTNAME <- Sys.getenv("SERVER_HOSTNAME")
HTTP_PATH <- Sys.getenv("HTTP_PATH")
ACCESS_TOKEN <- Sys.getenv("ACCESS_TOKEN")

# Singleton pattern using environment
QueryService <- new.env()
QueryService$instance <- NULL

get_instance <- function() {
  if (is.null(QueryService$instance)) {
    QueryService$instance <- list(
      execute_query = function(query, return_result_df = TRUE) {
        conn <- dbConnect(odbc::odbc(),
                          Driver = "Databricks",
                          Host = SERVER_HOSTNAME,
                          HTTPPath = HTTP_PATH,
                          Token = ACCESS_TOKEN)

        result <- dbSendQuery(conn, query)
        if (return_result_df) {
          df <- dbFetch(result)
        }
        dbClearResult(result)
        dbDisconnect(conn)

        if (return_result_df) {
          return(df)
        }
      },

      get_functional_spending_by_country_year = function() {
        query <- "
          SELECT * FROM prd_mega.boost_intermediate.quality_functional_gold
        "
        return(QueryService$instance$execute_query(query))
      }
    )
    message("UC client initialized")
  }
  return(QueryService$instance)
}

