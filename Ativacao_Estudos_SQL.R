renv::install(duckdb)
renv::install(DBI)
library(duckdb)
library(DBI)
library(here)
library(RSQLite)
library(datasets)

###################
setwd("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/SQL/SQL_project")
here::set_here("C:/Users/fernanda-romeiro/OneDrive - Governo do Estado do Rio Grande do Sul/Projetos/SQL/SQL_project")
##################
load("BR_SPEI_3.RData")

mtcars <- datasets::mtcars
##################

drv <- duckdb(dbdir = "quack.db")
con <- dbConnect(drv)

############################
# CONEXÃO DE BANCO LOCAL
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


DBI::dbWriteTable(con,
                  "mtcars",
                  as.data.frame(mtcars))
