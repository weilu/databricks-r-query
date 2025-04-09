# Databricks R Query

Starter scripts for querying databricks Unity Catalog (UC) using R

## Requirements

- R (>= 4.0 recommended)
- [ODBC Driver for Databricks](https://www.databricks.com/spark/odbc-drivers-download)
- Credentials to connect to Unity Catalog (UC)


## Obtaining UC Credentials

1. Connection Details:

Get connection details for the SQL Warehouse compute resource which is used for providing the database connection: https://docs.databricks.com/en/integrations/compute-details.html

2. Access Token:

Generate and obtain your access token from databricks following this instruction: https://docs.databricks.com/en/dev-tools/auth/pat.html


## Configure Environment Variables

With the obtained UC connection credentials, create or edit `~/.Renviron` with the following content:

```
SERVER_HOSTNAME=server hostname, e.g. adb-12345678.12.azuredatabricks.net
HTTP_PATH=http path, e.g. /sql/1.0/warehouses/abcdxxx123
ACCESS_TOKEN=access token
```

## Installation

### 1. Install R Packages

You can install the required R packages from CRAN:

```r
install.packages(c("DBI", "odbc", "arrow", "dplyr"))
```

## Running the sample script

```bash
Rscript example.R
```
