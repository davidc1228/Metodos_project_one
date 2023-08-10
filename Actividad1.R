install.packages("dplyr")
library(paqueteMET)
library(dplyr)  
library(tidyverse)
library(lubridate)
learnr::run_tutorial("Tutorial101", "paqueteMET")  # carga Tutorial101


df = CarreraLuz22
View(df)
glimpse(df[,5])
View(df[,"timerun"])


df[,"timerun"] = (round(df$timerun/60, 2))
view(df$timerun)

new_df <- mutate(df, timerun_minutes = round(timerun/60, 2))

media = mean(df$timerun, na.rm = TRUE)
media_desvest = mean(df$timerun, na.rm = TRUE, trim = 0,025)

