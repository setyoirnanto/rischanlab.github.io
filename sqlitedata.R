
install.packages("RSQLite",dependencies=TRUE)
library("RSQLite")

driver <- dbDriver("SQLite")
setwd("F:/behavio/edu.mit.media.funf.wifiscanner/default/archive")
list.files()
con <- dbConnect(driver,"47984475-129c-42fe-922d-a675cb62c01b_1.40121765E+9_pipeline_configuration.db")

dbListTables(con)

dbListFields(con,"data")

df <- dbGetQuery(con,"Select * from data")

head(df)
