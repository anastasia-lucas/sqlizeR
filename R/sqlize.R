#' sqlize
#'
#' This function creates SQL insert statements for a dataframe
#'
#' @param df data.frame
#' @param table string containing name of the SQL table
#' @param na_string string to replace NA values
#' @param file string containing file prefix to save .sql file if save=TRUE
#' @param save boolean to save result to file (default), otherwise print to screen
#' @export
#' @examples
#' data(morley)
#' sqlize(morley)

sqlize <- function(df, table="##mytable", na_string, file="mytable", save=TRUE) {

  df <- as.data.frame(df)

  # replace single quote with SQL escape quote
  df <- data.frame(lapply(df, function(x) gsub("'", "''", x)))

  if(!missing(na_string)){
    df[is.na(df)] <- na_string
  }

  df$sql <- paste0("INSERT INTO ", table, "(",
                  paste(names(df), collapse=", "), # column names
                  ") VALUES ('",
                  do.call(paste, c(df[names(df)], sep = "', '")),
                  "');")

  if(save==TRUE){
    write.table(df$sql, file=paste0(file, ".sql"),
                sep="\t", quote=FALSE, row.names=FALSE)
  } else {
    write.table(df$sql, sep="\t", quote=FALSE, row.names=FALSE)
  }
}
