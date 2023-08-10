install.packages("learnr") # solo una vez#·install.packages("devtools") # solo una vez
devtools::install_github("dgonxalex80/paqueteMET", force = TRUE)
install.packages("mice")
library(mice)
library(paqueteMET)
library(dplyr)  
library(tidyverse)
library(lubridate)

data = vivienda_faltantes

## Visualizacion de los datos
glimpse(data)
view(data)
size_sum(data)

## Visualizacion de los datos NA
sum(is.na(data))
sum(is.na.data.frame(data))



media_id = mean(data$id)
print(media_id)
na.exclude(data)
is.na(data$id)
print(length(data$id))
is.na.data.frame(data$id)

round(mean(na.exclude(data$piso)), 0)


data_piso = replace_na(data$piso, round(mean(na.exclude(data$piso)), 0))

view(data_piso)

data$piso = data_piso


set.seed(123)
datosNA<-sample_n(vivienda_faltantes, 8330)
str(datosNA)

faltantes <- colSums(is.na(datosNA))
faltantes

install.packages("naniar")
library(naniar)
gg_miss_var(datosNA)

media_parquea <- mean(datosNA$parquea, na.rm = TRUE)
datosNA$parquea[is.na(datosNA$parquea)] <- media_parquea
grafico <-md.pattern(datosNA, rotate.names = TRUE)
