# sqlizeR


## An R package to turn your dataframes into SQL code

```sqlizeR``` is a light-as-a-feather weight package with one job—to auto-create SQL insert statements from an existing dataframe.

## Usage

``` r
library(sqlizeR)

data(PlantGrowth)
sqlize(head(PlantGrowth), table="plant_growth", save=FALSE)
#> INSERT INTO plant_growth (weight, group) VALUES (4.17, 'ctrl');
#> INSERT INTO plant_growth (weight, group) VALUES (5.58, 'ctrl');
#> INSERT INTO plant_growth (weight, group) VALUES (5.18, 'ctrl');
#> INSERT INTO plant_growth (weight, group) VALUES (6.11, 'ctrl');
#> INSERT INTO plant_growth (weight, group) VALUES (4.5, 'ctrl');
#> INSERT INTO plant_growth (weight, group) VALUES (4.61, 'ctrl');
```
## Installation

This package is not available through CRAN, so please install the development version using ```devtools```

```devtools::install_github('anastasia-lucas/sqlizeR')```
