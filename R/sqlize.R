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
#' data(PlantGrowth)
#' sqlize(PlantGrowth, table="plant_growth", save=FALSE)

sqlize <- function(df, table, na_string, file="sqlizeR", save=TRUE) {

  df <- as.data.frame(df)

  df <- lapply(df, function(x) if (is.factor(x)) as.character(x) else {x})
  chr <- names(df[sapply(df, is.character)])

  if(missing(table)){
    stop("Please specify a name for your table!")
  }

  # replace single quote with SQL escape quote
  df <- data.frame(lapply(df, function(x) gsub("'", "''", x)))

  # quote the character columns
  df[chr] <- data.frame(lapply(df[chr], function(x) paste0("'", x, "'")))

  if(!missing(na_string)){
    df[] <- lapply(df, as.character)
    df[is.na(df)] <- na_string
  }

  df$sql <- paste0("INSERT INTO ", table, " (",
                  paste(names(df), collapse=", "), # column names
                  ") VALUES (",
                  do.call(paste, c(df[names(df)], sep = ", ")),
                  ");")

  if(save==TRUE){
    print(paste0("Saving code to ", file, ".sql"))
    write.table(df$sql, file=paste0(file, ".sql"),
                sep="\t", quote=FALSE,
                row.names=FALSE, col.names=FALSE)
  } else {
    write.table(df$sql, sep="\t", quote=FALSE,
                row.names=FALSE, col.names=FALSE)
  }
}
