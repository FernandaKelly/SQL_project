library(duckdb)

drv <- duckdb(dbdir = "quack.db")
 con <- dbConnect(drv)

con <- dbConnect(
  duckdb(),
  dbdir = "meu_banco.duckdb"
)

dbWriteTable(      
  con,
  "BR_SPEI_3",
  BR_SPEI_3,
  overwrite = TRUE
)