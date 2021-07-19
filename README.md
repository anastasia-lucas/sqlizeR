# sqlizeR


## An R package to SQL-ize your dataframes

sqlizeR is a light-as-a-feather weight package with one job and one job only—to auto-create SQL insert statements from an existing dataframe.

## Usage

``` r
library(sqlize)

data(morley)
sqlize(head(morley), table="morley", save=FALSE)
#> INSERT INTO morley (Expt, Run, Speed) VALUES ('1', '1', '850');
#> INSERT INTO morley (Expt, Run, Speed) VALUES ('1', '2', '740');
#> INSERT INTO morley (Expt, Run, Speed) VALUES ('1', '3', '900');
#> INSERT INTO morley (Expt, Run, Speed) VALUES ('1', '4', '1070');
#> INSERT INTO morley (Expt, Run, Speed) VALUES ('1', '5', '930');
#> INSERT INTO morley (Expt, Run, Speed) VALUES ('1', '6', '850');
```
## Installation

This package is not available through CRAN, so please install the development version using ```devtools```

```devtools::install_github('anastasia-lucas/sqlizeR')```
