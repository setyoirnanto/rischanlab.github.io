
#
df_levels <- c("edu.mit.media.funf.probe.builtin.ActivityProbe",
               "edu.mit.media.funf.probe.builtin.ApplicationsProbe",
               "edu.mit.media.funf.probe.builtin.BatteryProbe",
               "edu.mit.media.funf.probe.builtin.CallLogProbe",
               "edu.mit.media.funf.probe.builtin.ContactProbe",
               "edu.mit.media.funf.probe.builtin.HardwareInfoProbe",
               "edu.mit.media.funf.probe.builtin.LightSensorProbe",
               "edu.mit.media.funf.probe.builtin.MagneticFieldSensorProbe",
               "edu.mit.media.funf.probe.builtin.PressureSensorProbe",
               "edu.mit.media.funf.probe.builtin.ProximitySensorProbe",
               "edu.mit.media.funf.probe.builtin.RunningApplicationsProbe",
               "edu.mit.media.funf.probe.builtin.ScreenProbe",
               "edu.mit.media.funf.probe.builtin.SimpleLocationProbe",
               "edu.mit.media.funf.probe.builtin.SmsProbe",
               "edu.mit.media.funf.probe.builtin.WifiProbe")


df2_factor <-factor(df2$name,levels=df_levels)
df3_factor <-factor(df3$name,levels=df_levels)
df4_factor <-factor(df4$name,levels=df_levels)
df5_factor <-factor(df5$name,levels=df_levels)

df20_factor <-factor(df20$name,levels=df_levels)
df30_factor <-factor(df30$name,levels=df_levels)
df40_factor <-factor(df40$name,levels=df_levels)
df50_factor <-factor(df50$name,levels=df_levels)
#

install.packages("RSQLite",dependencies=TRUE)
library("RSQLite")

driver <- dbDriver("SQLite")
setwd("F:/behavio/db/data-15-3-pm")
list.files()
con2 <- dbConnect(driver,"x (2).db")
con3 <- dbConnect(driver,"x (3).db")
con4 <- dbConnect(driver,"x (4).db")
con5 <- dbConnect(driver,"x (5).db")

con20 <- dbConnect(driver,"x (20).db")
con30 <- dbConnect(driver,"x (30).db")
con40 <- dbConnect(driver,"x (40).db")
con50 <- dbConnect(driver,"x (50).db")

dbListTables(con2)

dbListFields(con2,"data")

df2 <- dbGetQuery(con2,"Select * from data")
df3 <- dbGetQuery(con3,"Select * from data")
df4 <- dbGetQuery(con4,"Select * from data")
df5 <- dbGetQuery(con5,"Select * from data")

df20 <- dbGetQuery(con20,"Select * from data")
df30 <- dbGetQuery(con30,"Select * from data")
df40 <- dbGetQuery(con40,"Select * from data")
df50 <- dbGetQuery(con50,"Select * from data")


nrow(df2) 
nrow(df3) 
nrow(df4) 
nrow(df5)

nrow(df20) 
nrow(df30) 
nrow(df40) 
nrow(df50)


table(df2$name)
table(df3$name)
table(df4$name)
table(df5$name)

table(df20$name)
table(df30$name)
table(df40$name)
table(df50$name)


head(df2)
summary(duplicated(df2[,c(2,4)]))
summary(duplicated(df3[,c(2,4)]))
summary(duplicated(df4[,c(2,4)]))
summary(duplicated(df5[,c(2,4)]))

summary(duplicated(df20[,c(2,4)]))
summary(duplicated(df30[,c(2,4)]))
summary(duplicated(df40[,c(2,4)]))
summary(duplicated(df50[,c(2,4)]))





