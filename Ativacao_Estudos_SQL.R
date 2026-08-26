renv::install(duckdb)
renv::install(DBI)
library(duckdb)
library(DBI)
library(here)

###################
setwd("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/SQL/SQL_project")
here::set_here("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/SQL/SQL_project")
##################
load("BR_SPEI_3.RData")
##################

drv <- duckdb(dbdir = "quack.db")
con <- dbConnect(drv)

############################
# BANCO LOCAL
############################

con <- dbConnect(
  duckdb(),
  dbdir = "meu_banco.duckdb"
)

DBI::dbWriteTable(
  con,
  "BR_SPEI_3",
  as.data.frame(BR_SPEI_3),
  overwrite = TRUE
)
